"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.FoodMenuButton = void 0;
var __selfType = requireType("./FoodMenuButton");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const Interactable_1 = require("SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable");
const validate_1 = require("SpectaclesInteractionKit.lspkg/Utils/validate");
let FoodMenuButton = class FoodMenuButton extends BaseScriptComponent {
    onAwake() {
        this.interactable = this.getSceneObject().getComponent(Interactable_1.Interactable.getTypeName());
        (0, validate_1.validate)(this.interactable, "Missing Interactable");
        this.interactable.onTriggerEnd.add(this.onPressed);
    }
    __initialize() {
        super.__initialize();
        this.onPressed = () => {
            if (this.syncController && this.foodName) {
                this.syncController.toggleFood(this.foodName);
            }
        };
    }
};
exports.FoodMenuButton = FoodMenuButton;
exports.FoodMenuButton = FoodMenuButton = __decorate([
    component
], FoodMenuButton);
//# sourceMappingURL=FoodMenuButton.js.map