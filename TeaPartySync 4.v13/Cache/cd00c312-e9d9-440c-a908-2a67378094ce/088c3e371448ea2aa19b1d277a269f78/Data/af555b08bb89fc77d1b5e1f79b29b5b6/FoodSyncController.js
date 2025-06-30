"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.FoodSyncController = void 0;
var __selfType = requireType("./FoodSyncController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const SyncEntity_1 = require("SpectaclesSyncKit.lspkg/Core/SyncEntity");
const StorageProperty_1 = require("SpectaclesSyncKit.lspkg/Core/StorageProperty");
let FoodSyncController = class FoodSyncController extends BaseScriptComponent {
    onAwake() {
        this.syncEntity = new SyncEntity_1.SyncEntity(this);
        this.syncEntity.addStorageProperty(this.foodStateProp);
        this.foodStateProp.onAnyChange.add(this.applyFoodState);
        this.syncEntity.notifyOnReady(() => this.applyFoodState(this.foodStateProp.currentValue));
    }
    showFood(name) {
        if (this.foodStates[name])
            return; // already shown
        this.foodStates[name] = true;
        this.foodStateProp.setPendingValue(JSON.stringify(this.foodStates));
    }
    __initialize() {
        super.__initialize();
        this.foodStateProp = StorageProperty_1.StorageProperty.manualString("foodStates", "");
        this.foodStates = {};
        this.applyFoodState = (stateStr) => {
            try {
                this.foodStates = JSON.parse(stateStr);
            }
            catch {
                this.foodStates = {};
            }
            for (let i = 0; i < this.foodNames.length; i++) {
                const name = this.foodNames[i];
                const isOn = !!this.foodStates[name];
                this.foodPrefabs[i].enabled = isOn;
            }
        };
    }
};
exports.FoodSyncController = FoodSyncController;
exports.FoodSyncController = FoodSyncController = __decorate([
    component
], FoodSyncController);
//# sourceMappingURL=FoodSyncController.js.map