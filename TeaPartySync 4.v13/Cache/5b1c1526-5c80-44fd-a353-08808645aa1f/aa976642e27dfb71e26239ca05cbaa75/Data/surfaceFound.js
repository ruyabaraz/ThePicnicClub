// SurfaceTweenRunnerWithDelay.js
// Description: Runs tween on objects AFTER surface is detected AND a short delay

//@input SceneObject surfaceDetectorObject {"label": "Surface Detector Object"}
//@input SceneObject[] objectsToAnimate {"label": "Objects to Animate"}
//@input string tweenName {"label": "Tween Name", "hint": "Tween method to run, e.g., fadeIn"}
//@input float delaySeconds = 5.0 {"label": "Delay After Detection (sec)"}

if (!script.surfaceDetectorObject) {
    print("❌ Surface Detector Object is not assigned.");
    return;
}

if (!script.tweenName || script.tweenName === "") {
    print("❌ Tween Name is not assigned.");
    return;
}

var surfaceDetectorScript = script.surfaceDetectorObject.getComponent("Component.ScriptComponent");
if (!surfaceDetectorScript || !surfaceDetectorScript.api.startGroundCalibration) {
    print("❌ SurfaceDetection script or API not found.");
    return;
}

// Function that runs after the delay
function runTweens() {
    for (var i = 0; i < script.objectsToAnimate.length; i++) {
        var obj = script.objectsToAnimate[i];
        if (!obj) continue;

        var tween = obj.getComponent("Component.TweenComponent");
        if (tween && tween.api[script.tweenName]) {
            tween.api[script.tweenName]();
        } else {
            print("⚠️ Tween '" + script.tweenName + "' not found on: " + obj.name);
        }
    }
}

// Callback when surface is detected
function onSurfaceDetected(pos, rot) {
    print("✅ Surface detected. Waiting " + script.delaySeconds + " seconds...");

    script.createEvent("DelayedCallbackEvent").bind(runTweens).reset(script.delaySeconds);
}

// Start the surface detection process
surfaceDetectorScript.api.startGroundCalibration(onSurfaceDetected);
