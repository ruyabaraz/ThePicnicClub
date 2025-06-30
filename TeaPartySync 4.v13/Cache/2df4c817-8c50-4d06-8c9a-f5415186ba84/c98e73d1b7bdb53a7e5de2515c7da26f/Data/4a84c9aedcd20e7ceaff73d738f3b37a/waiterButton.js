"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.WaiterButton = void 0;
var __selfType = requireType("./waiterButton");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let WaiterButton = class WaiterButton extends BaseScriptComponent {
    onStart() {
        this.createEvent("TapEvent").bind(() => {
            print("🖱️ Waiter button tapped.");
            if (!this.foodSyncController || !this.foodSyncController.api) {
                print("⚠️ No valid foodSyncController or missing API.");
                return;
            }
            const controller = this.foodSyncController.api;
            if (typeof controller.showFood === "function") {
                controller.showFood("waiter");
            }
            else {
                print("⚠️ showFood() not found on foodSyncController.");
            }
        });
    }
};
exports.WaiterButton = WaiterButton;
exports.WaiterButton = WaiterButton = __decorate([
    component
], WaiterButton);
//# sourceMappingURL=waiterButton.js.map