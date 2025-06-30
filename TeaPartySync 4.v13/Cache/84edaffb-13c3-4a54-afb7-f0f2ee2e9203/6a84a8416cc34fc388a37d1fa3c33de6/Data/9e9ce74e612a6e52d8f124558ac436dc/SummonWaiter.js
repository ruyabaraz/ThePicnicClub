"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SummonWaiter = void 0;
var __selfType = requireType("./SummonWaiter");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let SummonWaiter = class SummonWaiter extends BaseScriptComponent {
    showWaiter() {
        if (this.waiterPrefab) {
            this.waiterPrefab.enabled = true;
            print("🍽️ Waiter appeared!");
        }
        else {
            print("❌ Waiter prefab not assigned");
        }
        if (this.objectToHide) {
            this.objectToHide.enabled = false;
            print("🙈 Hiding object: " + this.objectToHide.name);
        }
    }
};
exports.SummonWaiter = SummonWaiter;
exports.SummonWaiter = SummonWaiter = __decorate([
    component
], SummonWaiter);
//# sourceMappingURL=SummonWaiter.js.map