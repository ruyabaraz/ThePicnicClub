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
        if (!name) {
            print("⚠️ showFood called with empty name.");
            return;
        }
        if (this.foodStates[name]) {
            print(`✅ '${name}' already shown. Skipping.`);
            return;
        }
        this.foodStates[name] = true;
        this.syncToProperty();
    }
    syncToProperty() {
        try {
            const json = JSON.stringify(this.foodStates);
            this.foodStateProp.setPendingValue(json);
        }
        catch (e) {
            print("⚠️ Failed to stringify foodStates: " + e);
        }
    }
    __initialize() {
        super.__initialize();
        this.foodStateProp = StorageProperty_1.StorageProperty.manualString("foodStates", "");
        this.foodStates = {};
        this.applyFoodState = (stateStr) => {
            let parsed = {};
            try {
                parsed = JSON.parse(stateStr);
                if (!parsed || typeof parsed !== "object")
                    throw new Error();
            }
            catch {
                print("⚠️ Could not parse foodStates. Resetting to empty.");
                parsed = {};
            }
            this.foodStates = parsed;
            for (let i = 0; i < this.foodNames.length; i++) {
                const name = this.foodNames[i];
                const prefab = this.foodPrefabs[i];
                if (!name) {
                    print(`⚠️ foodNames[${i}] is empty or undefined.`);
                    continue;
                }
                if (!prefab) {
                    print(`⚠️ Missing prefab for '${name}' at index ${i}.`);
                    continue;
                }
                const isOn = !!this.foodStates[name];
                prefab.enabled = isOn;
                print(`🔁 '${name}' set to ${isOn}`);
            }
        };
    }
};
exports.FoodSyncController = FoodSyncController;
exports.FoodSyncController = FoodSyncController = __decorate([
    component
], FoodSyncController);
//# sourceMappingURL=FoodSyncController.js.map