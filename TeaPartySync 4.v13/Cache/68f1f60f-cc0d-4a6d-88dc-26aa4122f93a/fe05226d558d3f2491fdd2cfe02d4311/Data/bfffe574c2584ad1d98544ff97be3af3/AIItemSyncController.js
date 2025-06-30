"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AIItemSyncController = void 0;
var __selfType = requireType("./AIItemSyncController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const SyncEntity_1 = require("SpectaclesSyncKit.lspkg/Core/SyncEntity");
const StorageProperty_1 = require("SpectaclesSyncKit.lspkg/Core/StorageProperty");
let AIItemSyncController = class AIItemSyncController extends BaseScriptComponent {
    onAwake() {
        this.syncEntity = new SyncEntity_1.SyncEntity(this);
        this.syncEntity.addStorageProperty(this.promptProp);
        this.promptProp.onAnyChange.add((val) => {
            this.applySyncedPrompts(val);
        });
        this.syncEntity.notifyOnReady(() => {
            this.applySyncedPrompts(this.promptProp.currentValue);
        });
    }
    generateAndSync(prompt) {
        if (!prompt || prompt.trim() === "")
            return;
        const id = prompt.toLowerCase().trim();
        if (this.localGenerated[id])
            return;
        this.localGenerated[id] = true;
        this.snap3DFactory.createInteractable3DObject(prompt);
        const prompts = this.getPromptList();
        prompts.push(prompt);
        this.promptProp.setPendingValue(JSON.stringify(prompts));
    }
    applySyncedPrompts(dataStr) {
        let prompts = [];
        try {
            prompts = JSON.parse(dataStr);
        }
        catch {
            return;
        }
        prompts.forEach((prompt) => {
            const id = prompt.toLowerCase().trim();
            if (!this.localGenerated[id]) {
                this.localGenerated[id] = true;
                this.snap3DFactory.createInteractable3DObject(prompt);
            }
        });
    }
    getPromptList() {
        try {
            return JSON.parse(this.promptProp.currentValue) || [];
        }
        catch {
            return [];
        }
    }
    __initialize() {
        super.__initialize();
        this.promptProp = StorageProperty_1.StorageProperty.manualString("syncedPrompts", "[]");
        this.localGenerated = {};
    }
};
exports.AIItemSyncController = AIItemSyncController;
exports.AIItemSyncController = AIItemSyncController = __decorate([
    component
], AIItemSyncController);
//# sourceMappingURL=AIItemSyncController.js.map