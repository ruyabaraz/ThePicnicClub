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
const StorageProperty_1 = require("SpectaclesSyncKit.lspkg/Core/StorageProperty");
const SyncEntity_1 = require("SpectaclesSyncKit.lspkg/Core/SyncEntity");
let FoodSyncController = class FoodSyncController extends BaseScriptComponent {
    onAwake() {
        this.syncEntity = new SyncEntity_1.SyncEntity(this);
        this.syncEntity.addStorageProperty(this.selectedIndexProp);
        this.selectedIndexProp.onAnyChange.add((newVal) => this.updateSelection(newVal));
        this.syncEntity.notifyOnReady(() => {
            // Re-apply current selection on join
            this.updateSelection(this.selectedIndexProp.currentValue);
        });
    }
    setFoodIndex(index) {
        if (index >= 0 && index < this.foodPrefabs.length) {
            this.selectedIndexProp.setPendingValue(index);
        }
    }
    updateSelection(index) {
        for (let i = 0; i < this.foodPrefabs.length; i++) {
            this.foodPrefabs[i].enabled = (i === index);
        }
    }
    __initialize() {
        super.__initialize();
        this.selectedIndexProp = StorageProperty_1.StorageProperty.manualInt("selectedFoodIndex", -1);
    }
};
exports.FoodSyncController = FoodSyncController;
exports.FoodSyncController = FoodSyncController = __decorate([
    component
], FoodSyncController);
//# sourceMappingURL=FoodSyncController.js.map