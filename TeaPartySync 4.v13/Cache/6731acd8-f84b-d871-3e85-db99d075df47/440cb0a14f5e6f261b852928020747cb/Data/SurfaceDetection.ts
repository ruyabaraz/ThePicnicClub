import { CircleAnimation } from './CircleAnimation';
import { BehaviorSystem } from 'LensStudio/Behavior/BehaviorSystem';

@component
export class SurfaceDetection extends BaseScriptComponent {

    @input
    @allowUndefined
    camObj: SceneObject;

    @input
    @allowUndefined
    visualObj: SceneObject;

    @input
    @allowUndefined
    animation: CircleAnimation;

    private worldQueryModule = require("LensStudio:WorldQueryModule") as WorldQueryModule;

    private readonly MAX_HIT_DISTANCE = 1000;
    private readonly MIN_HIT_DISTANCE = 50;
    private readonly CALIBRATION_FRAMES = 30;
    private readonly MOVE_DISTANCE_THRESHOLD = 5;
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
        this.onGroundFoundCallback = callback;
        this.updateEvent = this.createEvent("UpdateEvent");
        this.updateEvent.bind(() => {
            this.update();
        });
        this.animation.startCalibration(() => {
            this.onCalibrationComplete();
        });
    }

    private setDefaultPosition() {
        this.desiredPosition = this.camTrans.getWorldPosition().add(
            this.camTrans.forward.uniformScale(-this.DEFAULT_SCREEN_DISTANCE)
        );
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

        this.desiredPosition = this.camTrans.getWorldPosition().add(
            this.camTrans.forward.uniformScale(-this.DEFAULT_SCREEN_DISTANCE)
        );
        this.desiredRotation = this.camTrans.getWorldRotation();

        if (foundNormal.distance(vec3.up()) < .1) {
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

        if (calibrationAmount === 1) {
            this.calibrationPosition = this.desiredPosition;
            const rotOffset = quat.fromEulerVec(new vec3(Math.PI / 2, 0, 0));
            this.calibrationRotation = this.desiredRotation.multiply(rotOffset);
            this.removeEvent(this.updateEvent);
        }

        this.visualTrans.setWorldPosition(vec3.lerp(currPosition, this.desiredPosition, getDeltaTime() * this.SPEED));
        this.visualTrans.setWorldRotation(quat.slerp(currRotation, this.desiredRotation, getDeltaTime() * this.SPEED));
    }

    private onCalibrationComplete() {
        this.hitTestSession?.stop();
        this.onGroundFoundCallback?.(this.calibrationPosition, this.calibrationRotation);

        // ✅ Fire "ShowButtons" after 5 seconds
        const delayedEvent = this.createEvent("DelayedCallbackEvent");
        delayedEvent.bind(() => {
            const behaviorSystem = global.scene.getSystem("BehaviorSystem") as BehaviorSystem;
            if (behaviorSystem) {
                behaviorSystem.fireTrigger("ShowButtons");
            } else {
                print("BehaviorSystem not found");
            }
        });
        delayedEvent.reset(5.0);
    }
}
