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
// @input AssignableType mappingUnsuccessfulNotification
// @input AssignableType_1 alignUnsuccessfulNotification
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
var Module = require("../../../../../../../../Modules/Src/Assets/SpectaclesSyncKit.lspkg/Mapping/src/MappingFlowStates/MappingUnsuccessfulState/MappingUnsuccessfulStateInput");
Object.setPrototypeOf(script, Module.MappingUnsuccessfulStateInput.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("mappingUnsuccessfulNotification", []);
    checkUndefined("alignUnsuccessfulNotification", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
