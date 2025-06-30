@component
export class SurfaceDetection extends BaseScriptComponent {
    
    @input
    @hint("Buttons to show after delay")
    buttons: SceneObject[] = [];
    
    @input
    @hint("Delay in seconds before showing buttons")
    delayTime: number = 5.0;
    
    private surfaceDetected: boolean = false;
    private delayEvent: DelayedCallbackEvent;
    
    onAwake() {
        // Hide buttons initially
        this.hideButtons();
        
        // Listen for surface detection
        this.createEvent("SurfaceTrackingResetEvent").bind(() => {
            this.onSurfaceDetected();
        });
    }
    
    private onSurfaceDetected() {
        if (this.surfaceDetected) return;
        
        this.surfaceDetected = true;
        print("Surface detected! Starting delay timer...");
        
        // Create delayed callback
        this.delayEvent = this.createEvent("DelayedCallbackEvent");
        this.delayEvent.bind(() => {
            this.showButtons();
        });
        this.delayEvent.reset(this.delayTime);
    }
    
    private hideButtons() {
        this.buttons.forEach(button => {
            if (button) {
                button.enabled = false;
            }
        });
    }
    
    private showButtons() {
        print("Showing buttons after delay");
        this.buttons.forEach(button => {
            if (button) {
                button.enabled = true;
                // Trigger your tween alpha behavior here
                const tweenBehavior = button.getComponent("Component.ScriptComponent");
                if (tweenBehavior) {
                    // Send custom trigger to start alpha tween
                    global.behaviorSystem.sendCustomTrigger("ShowButtonTween");
                }
            }
        });
    }
}