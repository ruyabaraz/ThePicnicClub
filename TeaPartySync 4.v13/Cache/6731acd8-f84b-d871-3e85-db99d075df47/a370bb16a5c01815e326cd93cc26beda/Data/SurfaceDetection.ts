import { CircleAnimation } from './CircleAnimation';

@component
export class SurfaceDetection extends BaseScriptComponent {

    @input
    @allowUndefined
    camObj: SceneObject

    @input
    @allowUndefined
    visualObj: SceneObject

    @input
    @allowUndefined
    animation: CircleAnimation

    @input
    @hint("Delay in seconds before showing buttons after surface detection")
    buttonDelayTime: number = 5.0;

    private worldQueryModule = require("LensStudio:WorldQueryModule") as WorldQueryModule;

    // Set min and max hit distance to surfaces
    private readonly MAX_HIT_DISTANCE = 1000;
    private readonly MIN_HIT_DISTANCE = 50;

    // Number of frames before surface detection completes
    private readonly CALIBRATION_FRAMES = 30;

    // Distance in cm the surface visual can move before canceling
    private readonly MOVE_DISTANCE_THRESHOLD = 5;

    // Distance in cm from camera to visual when no surface is hit
    private readonly DEFAULT_SCREEN_DISTANCE = 200;

    private readonly SPEED = 10;

    private camTrans;
    private visualTrans;

    private calibrationPosition = vec3.zero();
    private calibrationRotation = quat.quatIdentity();

    private desiredPosition = vec3.zero();
    private desiredRotation = quat.quatIdentity();

    private hitTestSession = null;
    private updateEvent = null;

    private history = [];
    private calibrationFrames = 0;

    private onGroundFoundCallback = null;
    private surfaceDetected = false;
    private delayEvent: DelayedCallbackEvent;

    onAwake() {

        if (!this.camObj) {
            print("Please set Camera Obj input");
            return;
        }
        this.camTrans = this.camObj.getTransform();
        this.visualTrans = this.visualObj.getTransform();
        this.visualObj.enabled = false;

        try {
            const options = HitTestSessionOptions.create();
            options.filter = true;
            this.hitTestSession = this.worldQueryModule.createHitTestSessionWithOptions(options);
        } catch (e) {
            print(e);
        }

        this.createEvent("OnStartEvent").bind(() => {
            this.setDefaultPosition();
        });
    }

    startGroundCalibration(callback: (pos: vec3, rot: quat) => void) {
        this.setDefaultPosition();
        this.hitTestSession?.start();
        this.visualObj.enabled = true;
        this.history = [];
        this.calibrationFrames = 0;
        this.surfaceDetected = false; // Reset surface detection flag
        this.onGroundFoundCallback = callback;
        this.updateEvent = this.createEvent("UpdateEvent");
        this.updateEvent.bind(() => {
            this.update();
        });
        this.animation.startCalibration(() => {
            this.onCalibrationComplete()
        });
    }

    private setDefaultPosition() {
        this.desiredPosition = this.camTrans.getWorldPosition().add(this.camTrans.forward.uniformScale(-this.DEFAULT_SCREEN_DISTANCE));
        this.desiredRotation = this.camTrans.getWorldRotation();
        this.visualTrans.setWorldPosition(this.desiredPosition);
        this.visualTrans.setWorldRotation(this.desiredRotation);
    }

    private update() {
        const rayDirection = this.camTrans.forward;
        rayDirection.y += .1;
        const camPos = this.camTrans.getWorldPosition();
        const rayStart = camPos.add(rayDirection.uniformScale(-this.MIN_HIT_DISTANCE));
        const rayEnd = camPos.add(rayDirection.uniformScale(-this.MAX_HIT_DISTANCE));
        this.hitTestSession.hitTest(rayStart, rayEnd, (hitTestResult) => {
            this.onHitTestResult(hitTestResult);
        });
    }

    private onHitTestResult(hitTestResult) {
        let foundPosition = vec3.zero();
        let foundNormal = vec3.zero();
        if (hitTestResult != null) {
            foundPosition = hitTestResult.position;
            foundNormal = hitTestResult.normal;
        }
        this.updateCalibration(foundPosition, foundNormal);
    }

    private updateCalibration(foundPosition: vec3, foundNormal: vec3) {
        const currPosition = this.visualTrans.getWorldPosition();
        const currRotation = this.visualTrans.getWorldRotation();

        this.desiredPosition = this.camTrans.getWorldPosition().add(this.camTrans.forward.uniformScale(-this.DEFAULT_SCREEN_DISTANCE));
        this.desiredRotation = this.camTrans.getWorldRotation();

        //check if horizontal plane is being tracked
        if (foundNormal.distance(vec3.up()) < .1) {
            //make calibration face camera
            this.desiredPosition = foundPosition;
            const worldCameraForward = this.camTrans.right.cross(vec3.up()).normalize();
            this.desiredRotation = quat.lookAt(worldCameraForward, foundNormal);
            this.desiredRotation = this.desiredRotation.multiply(quat.fromEulerVec(new vec3(-Math.PI / 2, 0, 0)));

            this.history.push(this.desiredPosition);
            if (this.history.length > this.CALIBRATION_FRAMES) {
                this.history.shift();
            }
            const distance = this.history[0].distance(this.history[this.history.length - 1]);
            if (distance < this.MOVE_DISTANCE_THRESHOLD) {
                this.calibrationFrames++;
            } else {
                this.calibrationFrames = 0;
            }
        } else {
            this.calibrationFrames = 0;
            this.history = [];
        }

        const calibrationAmount = this.calibrationFrames / this.CALIBRATION_FRAMES;

        this.animation.setLoadAmount(calibrationAmount);

        if (calibrationAmount == 1) {
            this.calibrationPosition = this.desiredPosition;
            const rotOffset = quat.fromEulerVec(new vec3(Math.PI / 2, 0, 0));
            this.calibrationRotation = this.desiredRotation.multiply(rotOffset);
            this.removeEvent(this.updateEvent);

            // Trigger the delayed button show after surface detection is complete
            if (!this.surfaceDetected) {
                this.surfaceDetected = true;
                this.triggerDelayedButtonShow();
            }
        }

        //interpolate
        this.visualTrans.setWorldPosition(vec3.lerp(currPosition, this.desiredPosition, getDeltaTime() * this.SPEED));
        this.visualTrans.setWorldRotation(quat.slerp(currRotation, this.desiredRotation, getDeltaTime() * this.SPEED));
    }

    private triggerDelayedButtonShow() {
        print("Surface detected! Starting " + this.buttonDelayTime + " second delay timer...");
        
        // Create delayed callback for showing buttons
        this.delayEvent = this.createEvent("DelayedCallbackEvent");
        this.delayEvent.bind(() => {
            this.showButtons();
        });
        this.delayEvent.reset(this.buttonDelayTime);
    }

    private showButtons() {
        print("Triggering ShowButtons after delay");
        // Send custom trigger to any listening behavior scripts
        if (global.behaviorSystem) {
            global.behaviorSystem.sendCustomTrigger("ShowButtons");
        }
    }

    private onCalibrationComplete() {
        this.hitTestSession?.stop();
        this.onGroundFoundCallback?.(this.calibrationPosition, this.calibrationRotation);
    }
}