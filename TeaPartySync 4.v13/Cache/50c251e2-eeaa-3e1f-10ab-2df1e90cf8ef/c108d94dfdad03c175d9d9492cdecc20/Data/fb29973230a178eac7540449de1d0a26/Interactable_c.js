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
// @input float targetingMode = 3 {"hint":"Defines how Interactors can target and interact with this Interactable. Options include:\n- Direct: Only allows close pinch interactions where a hand directly touches the Interactable.\n- Indirect: Allows interactions from a distance with raycasting.\n- Direct/Indirect: Supports both direct and indirect interaction methods.\n- Poke: Enables finger poking interactions.\n- All: Supports all targeting modes (Direct, Indirect, and Poke).", "widget":"combobox", "values":[{"label":"Direct", "value":1}, {"label":"Indirect", "value":2}, {"label":"Direct/Indirect", "value":3}, {"label":"Poke", "value":4}, {"label":"All", "value":7}]}
// @input bool enableInstantDrag {"hint":"Enable this to allow the Interactable to instantly be dragged on trigger rather than obeying the Interactor's drag threshold."}
// @input bool isScrollable {"hint":"A flag that enables scroll interactions when this element is interacted with. When true, interactions with this element can scroll a parent ScrollView that has content extending beyond its visible bounds."}
// @input bool allowMultipleInteractors = true {"hint":"Determines whether this Interactable can be simultaneously controlled by multiple Interactors. When false, only one Interactor type (e.g., left hand or right hand) can interact with this Interactable at a time, and subsequent interaction attempts from different Interactors will be blocked. Set to true to enable interactions from multiple sources simultaneously, such as allowing both hands to manipulate the Interactable at once."}
// @ui {"widget":"separator"}
// @input bool enablePokeDirectionality {"hint":"Enable Poke Directionality to help prevent accidental interactions when users approach from unwanted angles."}
// @input float acceptableXDirections {"label":"X", "hint":"Controls from which directions a poke interaction can trigger this Interactable along the X-axis:\n- Left: Finger must approach from -X direction.\n- Right: Finger must approach from +X direction.\n- All: Accepts both directions.\n- None: Disables X-axis poke detection.", "widget":"combobox", "values":[{"label":"None", "value":0}, {"label":"Right", "value":1}, {"label":"Left", "value":2}, {"label":"All", "value":3}], "showIf":"enablePokeDirectionality"}
// @input float acceptableYDirections {"label":"Y", "hint":"Controls from which directions a poke interaction can trigger this Interactable along the Y-axis:\n- Top: Finger must approach from +Y direction.\n- Bottom: Finger must approach from -Y direction.\n- All: Accepts both directions.\n- None: Disables Y-axis poke detection.", "widget":"combobox", "values":[{"label":"None", "value":0}, {"label":"Top", "value":1}, {"label":"Bottom", "value":2}, {"label":"All", "value":3}], "showIf":"enablePokeDirectionality"}
// @input float acceptableZDirections = 1 {"label":"Z", "hint":"Controls from which directions a poke interaction can trigger this Interactable along the Z-axis:\n- Front: Finger must approach from +Z direction.\n- Back: Finger must approach from -Z direction.\n- All: Accepts both directions.\n- None: Disables Z-axis poke detection.", "widget":"combobox", "values":[{"label":"None", "value":0}, {"label":"Front", "value":1}, {"label":"Back", "value":2}, {"label":"All", "value":3}], "showIf":"enablePokeDirectionality"}
// @ui {"widget":"group_start", "label":"Sync Kit Support"}
// @input bool isSynced = true {"hint":"Relevant only to lenses that use SpectaclesSyncKit when it has SyncInteractionManager in its prefab. If set to true on the same frame as creating the Interactable component, events targeting this Interactable will be propagated to other users in the same Connected Lenses session using SyncKit's SyncInteractionManager."}
// @input float acceptableSyncInteractionTypes = 7 {"hint":"Relevant only to lenses that use SpectaclesSyncKit when it has SyncInteractionManager in its prefab. If set to SyncInteractionType.All, any user connected to the session can interact with this Interactable. If set to SyncInteraction.Host, only the session host can interact with this Interactable. If set to SyncInteraction.Local, only the local user can interact with this Interactable. Make sure to programmatically define the local user by setting Interactable.localConnectionId to the user's connection ID. If set to SyncInteraction.HostAndLocal, both the host and local user can interact with this Interactable. The Interactable's localConnectionId must be programmatically set by the developer.", "widget":"combobox", "values":[{"label":"All", "value":7}, {"label":"Host", "value":1}, {"label":"Local", "value":2}, {"label":"Host and Local", "value":3}], "showIf":"isSynced", "showIfValue":true}
// @ui {"widget":"group_end"}
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
var Module = require("../../../../../../../Modules/Src/Assets/SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable");
Object.setPrototypeOf(script, Module.Interactable.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("targetingMode", []);
    checkUndefined("enableInstantDrag", []);
    checkUndefined("isScrollable", []);
    checkUndefined("allowMultipleInteractors", []);
    checkUndefined("enablePokeDirectionality", []);
    checkUndefined("acceptableXDirections", [["enablePokeDirectionality",true]]);
    checkUndefined("acceptableYDirections", [["enablePokeDirectionality",true]]);
    checkUndefined("acceptableZDirections", [["enablePokeDirectionality",true]]);
    checkUndefined("isSynced", []);
    checkUndefined("acceptableSyncInteractionTypes", [["isSynced",true]]);
    if (script.onAwake) {
       script.onAwake();
    }
});
