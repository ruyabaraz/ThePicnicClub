if (script.onAwake) {
	script.onAwake();
	return;
};
function checkUndefined(property, showIfData){
   for (var i = 0; i < showIfData.length; i++){
       if (showIfData[i][0] && script[showIfData[i][0]] != showIfData[i][1]){
           return;
       }
   }
   if (script[property] == undefined){
      throw new Error('Input ' + property + ' was not provided for the object ' + script.getSceneObject().name);
   }
}
// @ui {"widget":"separator"}
// @ui {"widget":"label", "label":"This script manages audio output for generative AI models."}
// @ui {"widget":"separator"}
// @input Asset.AudioTrackAsset audioOutputTrack
var scriptPrototype = Object.getPrototypeOf(script);
if (!global.BaseScriptComponent){
   function BaseScriptComponent(){}
   global.BaseScriptComponent = BaseScriptComponent;
   global.BaseScriptComponent.prototype = scriptPrototype;
   global.BaseScriptComponent.prototype.__initialize = function(){};
   global.BaseScriptComponent.getTypeName = function(){
       throw new Error("Cannot get type name from the class, not decorated with @component");
   }
}
var Module = require("../../../../../../../Modules/Src/Assets/3D Generation/Snap3DInteractable.lspkg/Remote Service Gateway.lspkg/Helpers/DynamicAudioOutput");
Object.setPrototypeOf(script, Module.DynamicAudioOutput.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("audioOutputTrack", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
