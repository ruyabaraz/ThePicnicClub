"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.FoodGridContentCreator = void 0;
var __selfType = requireType("./RocketGridContentCreator");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const NativeLogger_1 = require("SpectaclesInteractionKit.lspkg/Utils/NativeLogger");
const TAG = "FoodGridContentCreator";
const log = new NativeLogger_1.default(TAG);
const Y_START = 0;
const Y_OFFSET = -5.4;
let FoodGridContentCreator = class FoodGridContentCreator extends BaseScriptComponent {
    onAwake() {
        if (this.objectPrefabs.length === 0) {
            log.f("FoodGridContentCreator: objectPrefabs array is empty!");
        }
        const sceneObj = this.getSceneObject();
        for (let i = 0; i < this.objectPrefabs.length; i++) {
            const prefab = this.objectPrefabs[i];
            const item = prefab.instantiate(sceneObj);
            const screenTransform = item.getComponent("Component.ScreenTransform");
            if (screenTransform) {
                screenTransform.offsets.setCenter(new vec2(0, Y_START + Y_OFFSET * i));
            }
            item.enabled = true; // Menüde görünmesini sağlamak için
            // Opsiyonel: Eğer her prefab'ın içinde bir buton varsa, ekstra setup yapılabilir.
        }
    }
};
exports.FoodGridContentCreator = FoodGridContentCreator;
exports.FoodGridContentCreator = FoodGridContentCreator = __decorate([
    component
], FoodGridContentCreator);
//# sourceMappingURL=RocketGridContentCreator.js.map