///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// Original Fluid2d Simulation, this script is altered for the ocean tool for 3D touch interactions.
/// Nov.14.2024 - Added Pressure Texture export
///             - Rename SceneObject at line 669 and 685 to avoid name collision.
///             - Remove all deprecated api.
///             - Added input using world touching position.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//@ui {"widget":"group_start", "label":"Simulation Settings"}
    //@input int resolutionType = 0 {"widget":"combobox", "label": "Resolution Base", "hint":"If Device Camera Resolution, simulation resolution is based on the device's native screen resolution. Custom allows for custom resolution dimensions.", "values":[{"label":"Device Camera Resolution", "value":0}, {"label":"Custom", "value":1}]}
    //@input float timeMult = 1.0 {"label": "Time Multiplier", "widget":"slider", "min":0.0, "max":4.0,"step":0.01, "hint":"An overall time multiplier on the simulation"}
    //@input int pressureIterations = 15 {"widget":"slider", "min":1, "max":100, "hint":"The number of iterations for the pressure solve. Higher values give better accuracy with increasing performance cost"}
    
//@ui {"widget":"group_end"}

//@ui {"widget":"separator"}

//@ui {"widget":"group_start", "label":"Boundary"}
    //@input int wrapMode = 0 {"widget":"combobox", "label": "Borders", "hint":"Whether the fluid has no boundaries and wraps around to the other side, or is bounded and reflects on the edges", "values":[{"label":"Wrap", "value":0}, {"label":"Reflect", "value":1}]}
//@ui {"widget":"group_end"}

//@ui {"widget":"separator"}

//@ui {"widget":"group_start", "label":"Velocity Field"}
    //@input Asset.Texture VelocityRenderTarget 
    //@input int velResDevice = 8 {"showIf":"resolutionType", "showIfValue":0, "widget":"combobox", "label": "Velocity Resolution", "hint":"The resolution of the fluid simulation and its velocity field", "values":[{"label":"1/1 Device Resolution", "value":1}, {"label":"1/2 Device Resolution", "value":2}, {"label":"1/4 Device Resolution", "value":4}, {"label":"1/6 Device Resolution", "value":6}, {"label":"1/8 Device Resolution", "value":8}, {"label":"1/10 Device Resolution", "value":10}]}
    //@input vec2 targetResolution = {144.0, 256.0} {"showIf":"resolutionType", "showIfValue":1, "label": "Velocity Resolution", "hint":"The resolution of the fluid simulation and its velocity field"}
    //@input float diffusionRate = 0.95 {"label":"Velocity Fade Rate", "widget":"slider", "min":0, "max":1, "step":0.001, "hint":"How quickly the velocity diffuses. Lower numbers means it fades slower and is more sensitive to forces. Higher numbers make the fluid more viscous and harder to push around"}
    //@input float pressureMult = 0.9 {"label":"Pressure Multiplier", "widget":"slider", "min":0, "max":1, "step":0.01, "hint":"How much pressure the system holds. Pressure is like another force that gives the fluid a kind of bounciness"}
    //@input float impulseMult = 1.0 {"label":"Input Multiplier"}
//@ui {"widget":"group_end"}

//@ui {"widget":"separator"}


//@ui {"widget":"group_start", "label":"Water Displacment"}

//@input Asset.Texture PressureRenderTarget {"label":"Pressure Render Target"}

//@ui {"widget":"group_end"}

//@ui {"widget":"separator"}

//@ui {"widget":"group_start", "label":"Touch 3D Input"}

//@input Asset.Material InputMaterial 
//@input float radius = 0.1 {"widget":"slider", "min":0.0, "max":1.0, "step":0.01}
//@input float softness = 0.5 {"widget":"slider", "min":0.0, "max":10.0, "step":0.01}
//@input bool speedToRadius = false {"hint":"Faster touch speeds adds to the radius."}
//@input float speedScale = 1.0 {"showIf":"speedToRadius"}
//@input float velocityMult = 0.2 {"label":"Translation Velocity"}
//@ui {"widget":"group_end"}

//@ui {"widget":"separator"}

//@input bool showSetup
//@ui {"widget":"group_start", "label":"Setup", "showIf": "showSetup"}
    //@input float cellSize = 16.0
    //@input float velocityRange = 10.0 
    //@input float divergenceRange = 1.0 
    //@input float pressureRange = 40.0
    //@input float impulseRange = 50.0
    //@input Asset.Texture emptyTex
    //@input Asset.Material AdvectMaterial 
    //@input Asset.Material DivergenceMaterial 
    //@input Asset.Material JacobiMaterial 
    //@input Asset.Material GradientMaterial 
    //@input Asset.Material BoundaryMaterial 
    //@input Asset.Material ClearMaterial 
    //@input Asset.Material FeedbackMaterial 
    //@input Asset.Material InputClearMaterial 
    //@input bool DEBUG
    // @input Asset.Texture FluidNormalRenderTarget
    // @input Asset.Material fluidNormalMat { "label" : "Fluid Normal Material" }
    // @input Asset.Material fluidNorblur { "label" : "Fluid Normal Blur Material" }
//@ui {"widget":"group_end"}

var normalLayer = LayerSet.makeUnique();

global._fluidPressureRange = new vec2( -script.pressureRange, script.pressureRange );
global._fluidVelocityRT = script.VelocityRenderTarget;
global._fluidPressureRT = script.PressureRenderTarget;
global._fluidNormalRT = script.FluidNormalRenderTarget;

script.reset = false;

var fluidGeometryObject = global._fluid2DTouchMeshVisual;


///////////////////////////////////////////////////////////////////////////////
// 3D Touch
///////////////////////////////////////////////////////////////////////////////


var validated = false;
var inputName = "locatorInput_" + script.getSceneObject().uniqueIdentifier.split(":")[0];
var fluidSim;
var fluidInput;
var velocityMat;
var colorMat;
var isMouseDown;

function validateSimInputs() {
    if (!script.fluid2dController) {
        print("Please add a Fluid2D Simulation component.");
        return false;
    }
    
    fluidSim = script.fluid2dController;
    fluidInput = script.fluid2dInput;
    validated = true;
    return true;
};



var event = script.createEvent("OnStartEvent");
event.bind(function(eventData)
{
    if (validateSimInputs()) {
        velocityMat = script.InputMaterial.clone();
        global.touchSystem.touchBlocking = true;
        velocityMat.mainPass.isMouseDown = 0;
    }
});

function parentComponentSearch(srcObj, component) {
    var foundObj = srcObj;
    if (foundObj.getComponent(component)) {
        return foundObj;
    } else {
        if (foundObj.hasParent()) {
            return parentComponentSearch(foundObj.getParent(), component);
        } else {
            return null;
        }
    }
}



//Create collision body if it doean't exist or disabled
var hasPhysics = parentComponentSearch( fluidGeometryObject.getSceneObject(), "Physics.BodyComponent");
if( !hasPhysics || !hasPhysics.getComponent("Physics.BodyComponent").enabled ){
    var physicsComponent = fluidGeometryObject.getSceneObject().createComponent("Physics.BodyComponent");
    physicsComponent.dynamic = false;
}


// Touch start
var event = script.createEvent("TouchStartEvent");
event.bind(function(eventData)
{
    isMouseDown = 0;

});

// Touch Move
script.createEvent("TouchMoveEvent").bind(function(touchArgs) {
    
    isMouseDown = 1; 
    var touchPos = touchArgs.getTouchPosition();
    var nearPos = global._oceanCamera.screenSpaceToWorldSpace(touchPos, 0);
    var farPos = global._oceanCamera.screenSpaceToWorldSpace(touchPos, global._oceanCamera.far - global._oceanCamera.near);
    Physics.createGlobalProbe().rayCastAll(nearPos, farPos, function(hitResults) {
    for(var i=0; i<hitResults.length; i++) {
        var hit = hitResults[i];
        global._touchPos = hit.position;
        }
    });
    
    
});

// Touch end
var event = script.createEvent("TouchEndEvent");
event.bind(function(eventData)
{
    isMouseDown = 0;
    
});

// Touch end
var event = script.createEvent("TouchEndEvent");
event.bind(function(eventData)
{
    isMouseDown = 0;
    
});
    

// Update
var event = script.createEvent("UpdateEvent");
event.bind(function(eventData)
{
    if (validated) {
        if (fluidSim.initialized && fluidInput) {
            fluidInput.addVelocityInput(inputName, script.getSceneObject(), velocityMat);
        }
    }
    
    updateScriptParams();

});


var locatorCurrent = global._touchPos == undefined ? fluidGeometryObject.getTransform().getWorldPosition() : global._touchPos;
//var locatorCurrent = global._touchPos;
var locatorPrevious = locatorCurrent;
var bboxDim = fluidGeometryObject.mesh.aabbMax.sub(fluidGeometryObject.mesh.aabbMin).uniformScale(0.5);
bboxDim = Math.max(bboxDim.x, Math.max(bboxDim.y, bboxDim.z));


function updateScriptParams() {
    
    if(global._touchPos == undefined){
        return;
    }

    var locatorCurrent = global._touchPos;
    var targetAPI = script.customScript;
    
    if (velocityMat) {
        velocityMat.mainPass.touchRadius = script.radius;
        velocityMat.mainPass.softness = script.softness;
        velocityMat.mainPass.speedToRadius = script.speedToRadius;
        velocityMat.mainPass.speedScale = script.speedScale;
        velocityMat.mainPass.velocityMult = script.velocityMult * 10000000.0;;

        velocityMat.mainPass.locatorPos = locatorCurrent;
        velocityMat.mainPass.locatorPosPrev = locatorPrevious;
       
        velocityMat.mainPass.fluidGeoMat = fluidGeometryObject.getSceneObject().getTransform().getWorldTransform();
        velocityMat.mainPass.fluidGeoMatInv = fluidGeometryObject.getSceneObject().getTransform().getInvertedWorldTransform();
        velocityMat.mainPass.fluidGeoBboxDim = bboxDim;

        velocityMat.mainPass.isMouseDown = isMouseDown;
       
    }
  
    locatorPrevious = locatorCurrent;
};


// Destroy
var event = script.createEvent("OnDestroyEvent");
event.bind(function(eventData)
{
    fluidInput.destroyInput(inputName);
});

blurFluidNor();



///////////////////////////////////////////////////////////////////////////////
// Simulation
///////////////////////////////////////////////////////////////////////////////


var Fluid2dController = (function() {
    function Fluid2dController() {

        this.velocityResolution = new vec2(144, 256);
        this.positionResolution = new vec2(144, 256);
        this.pressureIterations = 5;
        this.wrapMode = 0;
        this.timeMult = 1.0;

        this.diffusionRate = 0.95;
        this.pressureMult = 0.9;

        this.cellSize = 16.0;
        this.impulseMult = 0.0;
        this.velocityRange = 50.0; 
        this.divergenceRange = 1.0; 
        this.pressureRange = script.pressureRange;
        this.impulseRange = 50.0;

        this.simulatePosField = false;

        this.passes = {};

        this.initialized = false;
        this.cleared = 0;
    }

    // Initialize goes in the update event so we can properly query the device camera resolution
    Fluid2dController.prototype.initialize = function() {   
        if (!this.initialized) {
            if (global.deviceInfoSystem.getTrackingCamera()) {
                if (this.validateInputs() == true) {

                    if (script.resolutionType == 0) {
                        var deviceRes = global.deviceInfoSystem.getTrackingCamera().resolution;
                        this.velocityResolution = scaleResolution(deviceRes, script.velResDevice);
                    }
                    else {
                        this.velocityResolution = script.targetResolution;
                    }
                    this.pressureIterations = script.pressureIterations;

                    this.wrapMode = script.wrapMode;
            
                    this.cellSize = script.cellSize;
                    this.velocityRange = script.velocityRange;
                    this.divergenceRange = script.divergenceRange; 
                    this.pressureRange = script.pressureRange;
                    this.impulseRange = script.impulseRange;

                    this.simulatePosField = script.simulatePosField;

                    this.setupPasses();
                    this.setRenderOrder();
                    this.assignRenderTargets();
                    this.updateController();
                    this.setStaticUniforms();

                    this.initialized = true;
                    this.reset(1);

                    if (script.DEBUG) print("Initialized Fluid Simulation");
                } // if validateInputs()
            } //if getTrackingCamera()
        } //if initialized
        else if (this.cleared == 0) {
            this.reset(0);
            this.cleared = 1;
        }
    };
    
    Fluid2dController.prototype.validateInputs = function() {
        if (!script.VelocityRenderTarget) {
            print("Please add a Velocity Render Target.");
            return false;
        } 

        else {
            return true;
        }
    };
    

    Fluid2dController.prototype.setupPasses = function() {
        this.passes.boundaryPass        = new Pass('BoundaryPass', script.BoundaryMaterial.clone(), {"resolution":this.velocityResolution});
        this.passes.velocityPass        = new Pass('VelocityPass', script.AdvectMaterial.clone(), {"resolution":this.velocityResolution, "renderTarget":script.VelocityRenderTarget, "fixRT":true});
        this.passes.divergencePass      = new Pass('DivergencePass', script.DivergenceMaterial.clone(), {"resolution":this.velocityResolution});
        this.passes.clearPass           = new Pass('ClearPass', script.ClearMaterial.clone(), {"resolution":this.velocityResolution});

        this.passes.jacobiPass          = new Pass('JacobiPass', script.JacobiMaterial.clone(), {"renderTarget":this.passes.clearPass.renderTarget, "isJacobi":true});
        this.passes.jacobiFeedbackPass  = new Pass('JacobiFeedbackPass', script.FeedbackMaterial.clone(), {"resolution":this.velocityResolution, "renderTarget":script.PressureRenderTarget, "fixRT":true});
        this.passes.gradientPass        = new Pass('GradientPass', script.GradientMaterial.clone(), {"resolution":this.velocityResolution});

        this.boundaryMat = this.passes.boundaryPass.material.mainPass;
        this.velocityMat = this.passes.velocityPass.material.mainPass;
        this.divergenceMat = this.passes.divergencePass.material.mainPass;
        this.clearMat = this.passes.clearPass.material.mainPass;
        this.jacobiMat = this.passes.jacobiPass.material.mainPass;
        this.jacobiFeedbackMat = this.passes.jacobiFeedbackPass.material.mainPass;
        this.gradientMat = this.passes.gradientPass.material.mainPass;

    };


    Fluid2dController.prototype.setRenderOrder = function() {    
        var curRenderOrder = 0;
    
        // Set render order of all passes
        for (var i in this.passes) {
            var name = this.passes[i].name;
            var baseObject = this.passes[i].sceneObject;
    
            baseObject.getFirstComponent('Component.Camera').renderOrder = curRenderOrder;
    
            if (name == 'JacobiPass') {
                for (var j = 0; j < this.pressureIterations; j++) {
                    baseObject.getChild(j).getFirstComponent('Component.PostEffectVisual').setRenderOrder(curRenderOrder);
                    curRenderOrder += 1;
                    // print(name + ': ' + baseObject.getChild(j).getFirstComponent('Component.PostEffectVisual').getRenderOrder());
                }            
            }   
            else {
                baseObject.getChild(0).getFirstComponent('Component.PostEffectVisual').setRenderOrder(curRenderOrder);
                curRenderOrder += 1;   
                // print(name + ': ' + baseObject.getChild(0).getFirstComponent('Component.PostEffectVisual').getRenderOrder());            
            }
        }
    
    };
    
    Fluid2dController.prototype.assignRenderTargets = function() {   
        this.passes.jacobiPass.renderTarget.control.inputTexture = this.passes.jacobiFeedbackPass.renderTarget;

        this.velocityMat.sTarget = this.passes.gradientPass.renderTarget;
        this.velocityMat.sVelocity = this.passes.gradientPass.renderTarget;
        this.velocityMat.sBoundary = this.passes.boundaryPass.renderTarget;
        this.velocityMat.samplers.sTarget.filtering = FilteringMode.Nearest;
        this.velocityMat.samplers.sVelocity.filtering = FilteringMode.Bilinear; //the only bilinearly filtered render target

        this.divergenceMat.sVelocity = this.passes.velocityPass.renderTarget;
        this.divergenceMat.sBoundary = this.passes.boundaryPass.renderTarget;
        this.divergenceMat.samplers.sVelocity.filtering = FilteringMode.Nearest;
    
        this.clearMat.sPressure = this.passes.jacobiFeedbackPass.renderTarget;
        this.clearMat.samplers.sPressure.filtering = FilteringMode.Nearest;
    
        this.jacobiMat.sDivergence = this.passes.divergencePass.renderTarget;
        this.jacobiMat.sPressure = this.passes.jacobiPass.renderTarget;
        this.jacobiMat.sBoundary = this.passes.boundaryPass.renderTarget;
        this.jacobiMat.samplers.sDivergence.filtering = FilteringMode.Nearest;
        this.jacobiMat.samplers.sPressure.filtering = FilteringMode.Nearest;

        this.jacobiFeedbackMat.sTexture = this.passes.jacobiPass.renderTarget;
        this.jacobiFeedbackMat.samplers.sTexture.filtering = FilteringMode.Nearest;
    
        this.gradientMat.sPressure = this.passes.jacobiFeedbackPass.renderTarget;
        this.gradientMat.sVelocity = this.passes.velocityPass.renderTarget;
        this.gradientMat.sBoundary = this.passes.boundaryPass.renderTarget;
        this.gradientMat.samplers.sPressure.filtering = FilteringMode.Nearest;
        this.gradientMat.samplers.sVelocity.filtering = FilteringMode.Nearest;     
    
        if (this.simulatePosField) {
            this.posMat.sTarget = this.passes.posFeedbackPass.renderTarget;
            this.posMat.sVelocity = this.passes.gradientPass.renderTarget;
            this.posFeedbackMat.sTexture = this.passes.posPass.renderTarget;
        }
      
    };


    Fluid2dController.prototype.setStaticUniforms = function() {   
        var advectCellInv = 1.0/this.cellSize;
        var halfCellInv = 0.5 * advectCellInv;
        var pressureAlpha = -this.cellSize * this.cellSize;

        var velocityRange = new vec2(-this.velocityRange, this.velocityRange);
        var divergenceRange = new vec2(-this.divergenceRange, this.divergenceRange);
        var pressureRange = new vec2(-this.pressureRange, this.pressureRange);
        var impulseRange = new vec2(-this.impulseRange, this.impulseRange);

        this.boundaryMat.wrapMode = this.wrapMode;
        this.boundaryMat.resInv = new vec2(1.0, 1.0).div(this.passes.velocityPass.renderTarget.control.resolution);
        

        this.velocityMat.timeMult = this.timeMult;
        this.velocityMat.diffusionRate = this.diffusionRate;
        this.velocityMat.impulseMult = 0.0;
        this.velocityMat.velocityRange = velocityRange;
        this.velocityMat.impulseRange = impulseRange;
        this.velocityMat.reset = 0;
        this.velocityMat.wrapMode = this.wrapMode;
        // not sure why below deosn't work, need to set it at the material
        this.velocityMat.sTarget.wrapMode = this.wrapMode;

        this.divergenceMat.velocityRange = velocityRange;
        this.divergenceMat.divergenceRange = divergenceRange;
        this.divergenceMat.halfInverseCell = halfCellInv;
        this.divergenceMat.reset = 0;
        this.divergenceMat.wrapMode = this.wrapMode;
    
        this.clearMat.clearValue = this.pressureMult;
        this.clearMat.pressureRange = pressureRange;
        this.clearMat.reset = 0;
    
        this.jacobiMat.divergenceRange = divergenceRange;
        this.jacobiMat.pressureRange = pressureRange;
        this.jacobiMat.alpha = pressureAlpha;
        this.jacobiMat.reset = 0;
        this.jacobiMat.wrapMode = this.wrapMode;
        
        this.jacobiFeedbackMat.wrapMode = this.wrapMode;
        
    
        this.gradientMat.velocityRange = velocityRange;
        this.gradientMat.pressureRange = pressureRange;
        this.gradientMat.gradientScale = halfCellInv;  
        this.gradientMat.reset = 0;
        this.gradientMat.wrapMode = this.wrapMode;

    };    

    Fluid2dController.prototype.reset = function(resetVal) { 
        if (this.initialized) {
            this.velocityMat.reset = resetVal;
            this.divergenceMat.reset = resetVal;
            this.clearMat.reset = resetVal;
            this.jacobiMat.reset = resetVal;
            this.gradientMat.reset = resetVal;
        
        }
    };        

    Fluid2dController.prototype.updateController = function() {
        this.timeMult = script.timeMult;
        this.diffusionRate = script.diffusionRate;
        this.pressureMult = script.pressureMult;
        this.impulseMult = script.impulseMult;

    };

    Fluid2dController.prototype.updateUniforms = function() {
        this.velocityMat.timeMult = this.timeMult;
        this.velocityMat.diffusionRate = this.diffusionRate;
        this.velocityMat.impulseMult = this.impulseMult;
        if (getTime() > 0.5) { //wait for initialization
            this.velocityMat.useVelocityInputTexture = false;
        }

        this.clearMat.clearValue = this.pressureMult;
    
    };

    Fluid2dController.prototype.getInputs = function() {
        if (script.fluid2dInput && script.fluid2dInput.initialized) {
            if (script.fluid2dInput.cleared == 1) {
                this.velocityMat.sImpulseTexture = script.fluid2dInput.velocityPass.renderTarget;
                // this.velocityMat.samplers.sImpulseTexture.filtering = FilteringMode.Nearest;
                this.velocityMat.samplers.sImpulseTexture.filtering = FilteringMode.Bilinear;
                this.velocityMat.useVelocityComponentInput = true;

            }
        }
    };

    Fluid2dController.prototype.update = function() {
        if (!this.initialized) {
            this.initialize();
        }
        else {
            this.getInputs();
            this.updateController();
            this.updateUniforms();
        }
    };    

    return Fluid2dController;

}());


// Initialize
//global.fluid2dController = new Fluid2dController();
script.fluid2dController = new Fluid2dController();



///////////////////////////////////////////////////////////////////////////////
// Events
///////////////////////////////////////////////////////////////////////////////

// Update
var initEvent = script.createEvent('UpdateEvent');
initEvent.bind(function() {
    script.fluid2dController.update();
    if (script.fluid2dInput) script.fluid2dInput.update();

    if (script.reset) {
        script.fluid2dController.reset(0)
        script.reset = false;
    }

});

// Camera back
var event = script.createEvent("CameraBackEvent");
event.bind(function (eventData)
{
    script.fluid2dController.reset(1)
    script.reset = true;
});

// Camera front
var event = script.createEvent("CameraFrontEvent");
event.bind(function (eventData)
{
    script.fluid2dController.reset(1)
    script.reset = true;
});



///////////////////////////////////////////////////////////////////////////////
// Fluid 2d Input
///////////////////////////////////////////////////////////////////////////////

var Fluid2dInput = (function() {
    function Fluid2dInput() {
        this.velocityPass;

        this.velocityInputs = [];
        this.numVelocityInputs = 1;
        this.aspectRatio = 1.0;

        this.elapsedTime = getTime();
        this.cleared = 0;
        this.initialized = false;
    }

    // Initialize goes in the update event so we can properly query the device camera resolution
    Fluid2dInput.prototype.initialize = function() {
        if (script.fluid2dController.initialized) {
            this.velocityPass = new Pass("Velocity Input Pass", script.InputClearMaterial.clone(), {"resolution":script.fluid2dController.velocityResolution});
            this.aspectRatio = script.fluid2dController.velocityResolution.x / script.fluid2dController.velocityResolution.y;
            this.timeMult = script.fluid2dController.timeMult;
            this.elapsedTime = getTime();
            this.initialized = true;
            this.reset(1);
            // print("Initialized Fluid Input")
        }
    };

    Fluid2dInput.prototype.update = function() {
        if (!this.initialized) {
            this.initialize();
        }
        else if (this.cleared == 0) {
            this.reset(0);
            this.cleared = 1;
        }
        this.checkIfDisabled();
        this.watchSceneObjects();
    };
   

    Fluid2dInput.prototype.addVelocityInput = function(name, sceneObject, material) {
        if (this.initialized) {
            if (!this.velocityInputs[name]) {
                this.velocityInputs[name] = this.velocityPass.createPostEffect(material);
                this.velocityInputs[name].setRenderOrder(this.numVelocityInputs);
                this.velocityInputs[name].SO = sceneObject;
                material.mainPass.aspectRatio = this.aspectRatio;  
                material.mainPass.timeMult = this.timeMult;  
                material.mainPass.impulseRange = new vec2(-script.fluid2dController.impulseRange, script.fluid2dController.impulseRange);  
                this.numVelocityInputs += 1;
                this.cleared = 0;
                if (script.DEBUG) print("added velocity " + name + " at " + this.velocityInputs[name].getRenderOrder());
            }
        }
    }

    Fluid2dInput.prototype.checkIfDisabled = function() {
        // If simulation scene object was disabled for more than 3 frames, reset the input controller 
        if ((getTime() - this.elapsedTime) > getDeltaTime() * 3.0) {
            this.velocityPass = null;
            this.velocityInputs = [];
            this.numVelocityInputs = 1;
            this.initialized = false;

        }
        this.elapsedTime = getTime();
    }

    Fluid2dInput.prototype.watchSceneObjects = function() {
        if (this.initialized) {
            for (var velInput in this.velocityInputs) {
                this.velocityInputs[velInput].enabled = this.velocityInputs[velInput].SO.enabled;
            }           
        
        }
    };

    Fluid2dInput.prototype.destroyInput = function(inputName) {
        if (this.velocityInputs[inputName]) {
            this.velocityInputs[inputName].destroy();
            delete this.velocityInputs[inputName];
            this.numVelocityInputs -= 1;
        }
        
    };    

    Fluid2dInput.prototype.reset = function(resetVal) { 
        if (this.initialized) {
            for (var velInput in this.velocityInputs) {
                this.velocityInputs[velInput].mainMaterial.mainPass.reset = resetVal;
            }       
        }
    };

    return Fluid2dInput;
}());


// Initialize
script.fluid2dInput = new Fluid2dInput();




///////////////////////////////////////////////////////////////////////////////
// Pass class
function Pass (name, material, opts) {
    this.name = name;
    this.material = material;
    this.renderTarget;

    this.createRenderTarget = function(resolution) {
        var renderTarget = global.scene.createRenderTargetTexture();
        renderTarget.control.useScreenResolution = false;
        renderTarget.control.resolution = resolution;
        renderTarget.control.clearColorEnabled = true;
        renderTarget.control.clearDepthEnabled = false;
        renderTarget.control.fxaa = false;
        renderTarget.control.msaa = false;
        return renderTarget;
    }
    
    this.fixRenderTargetParams = function(renderTarget, res) {
        renderTarget.control.useScreenResolution = false;
        renderTarget.control.resolution = res;
        renderTarget.control.clearColorEnabled = true;
        renderTarget.control.clearDepthEnabled = false;
        renderTarget.control.fxaa = false;
        renderTarget.control.msaa = false;
        return renderTarget;
    };

    this.createCamera = function() {
        var objectBase = scene.createSceneObject(this.name);
        var cameraComponent = objectBase.createComponent("Component.Camera");
        cameraComponent.type = Camera.Type.Orthographic;
        cameraComponent.aspect = 1.0;
        cameraComponent.size = 2.0;
        cameraComponent.enabled = true;
        cameraComponent.renderLayer = this.layer;
        cameraComponent.renderTarget = this.renderTarget;
        cameraComponent.devicePropertyUsage = Camera.DeviceProperty.None;
        cameraComponent.near = 1.0;
        cameraComponent.far = 2.0;
        cameraComponent.enableClearColor = false;
        cameraComponent.enableClearDepth = false;
        return objectBase;
    }
    
    this.createPostEffect = function(material) {
        var postEffectObject = scene.createSceneObject(material.name);
        postEffectObject.setParent(this.sceneObject);
        var postEffectComponent = postEffectObject.createComponent("Component.PostEffectVisual");
        postEffectComponent.mainMaterial = material;
        postEffectObject.layer = this.layer;
        return postEffectComponent;
    }    

    // Fix supplied render target to match resolution and internal params
    if (opts["renderTarget"] && opts["fixRT"]) {
        this.renderTarget = this.fixRenderTargetParams(opts["renderTarget"], opts["resolution"]);
    }

    // Use a supplied render target directly
    else if (opts["renderTarget"] && !opts["resolution"]) {
        this.renderTarget = opts["renderTarget"];
    }

    // Create a new render target
    else {
        this.renderTarget = this.createRenderTarget(opts["resolution"]);
    }

    this.layer = LayerSet.makeUnique();
    this.sceneObject = this.createCamera();
    if (this.material != null) this.createPostEffect(this.material);
        
    if (opts["isJacobi"]) {
        for (var i = 0; i < script.pressureIterations-1; i++) {
            this.createPostEffect(this.material);
        }
    }

    if (script.DEBUG) {
        if (opts["resolution"]) print(name + " " + opts["resolution"])
        else print(name)
    }

    return this;
}

function scaleResolution(inputRes, scaleFactor) {
    var res = inputRes.uniformScale(1/scaleFactor);
    res.x = Math.floor(res.x);
    res.y = Math.floor(res.y);
    return res;
}

function createPostEffectForPass( material, layer ) {
    var meshSceneObj = scene.createSceneObject( "" );
    meshSceneObj.layer = layer;
    meshSceneObj.renderOrder = script.ssn_maxRenderOrder;
    script.ssn_maxRenderOrder++;
    meshSceneObj.createComponent( "PostEffectVisual" ).mainMaterial = material;
    return meshSceneObj;
}


function setupBlurPasses( tex ) {
    var blurStrength = 4.0
    var pass = script.fluidNorblur.mainPass;
    pass.normTex = tex;
    pass.samplers.normTex.wrapU = WrapMode.ClampToEdge;
    pass.samplers.normTex.wrapV = WrapMode.ClampToEdge;
    pass.blurDirection = new vec2 ( 0.0, blurStrength );

    var blurMatH = script.fluidNorblur.clone();
    blurMatH.mainPass.blurDirection = new vec2 ( blurStrength, 0.0 );
    
    // Do the blur
    createPostEffectForPass( blurMatH, normalLayer );
    createPostEffectForPass( script.fluidNorblur, normalLayer );
}

function blurFluidNor( material, layer ) {
    
    var normalCamera = global.scene.createSceneObject( "normalCam" );
    var normalCameraComponent = normalCamera.createComponent( "Component.Camera" );
    normalCameraComponent.renderLayer = normalLayer;
    normalCameraComponent.renderTarget = global._fluidNormalRT;
    createPostEffectForPass( script.fluidNormalMat, normalLayer );

    setupBlurPasses( global._fluidNormalRT );

}
