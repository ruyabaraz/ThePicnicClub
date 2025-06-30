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
        this.syncEntity.addStorageProperty(this.aiItemsProp);
        this.aiItemsProp.onAnyChange.add(this.applySyncedItems);
        this.syncEntity.notifyOnReady(() => {
            this.applySyncedItems(this.aiItemsProp.currentValue);
        });
    }
    /** Call this function when a new AI prompt is used locally */
    generateAndSync(prompt, position) {
        if (!prompt || prompt.trim() === "") {
            print("⚠️ Empty AI prompt.");
            return;
        }
        const pos = position || this.targetSceneObject.getTransform().getWorldPosition();
        const itemId = this.generateId(prompt, pos);
        if (this.localGenerated[itemId]) {
            print(`✅ '${prompt}' already synced.`);
            return;
        }
        // Locally generate item first
        this.snap3DFactory.createInteractable3DObject(prompt, pos);
        this.localGenerated[itemId] = true;
        // Add to shared list
        let items = this.getCurrentItems();
        items.push({ prompt, pos: [pos.x, pos.y, pos.z] });
        const newStr = JSON.stringify(items);
        this.aiItemsProp.setPendingValue(newStr);
    }
    getCurrentItems() {
        try {
            return JSON.parse(this.aiItemsProp.currentValue) || [];
        }
        catch {
            return [];
        }
    }
    generateId(prompt, pos) {
        return `${prompt}-${pos.x.toFixed(2)}-${pos.y.toFixed(2)}-${pos.z.toFixed(2)}`;
    }
    __initialize() {
        super.__initialize();
        this.aiItemsProp = StorageProperty_1.StorageProperty.manualString("aiGeneratedItems", "[]");
        this.localGenerated = {};
        this.applySyncedItems = (dataStr) => {
            let parsed = [];
            try {
                parsed = JSON.parse(dataStr);
                if (!Array.isArray(parsed))
                    throw new Error();
            }
            catch {
                print("⚠️ Failed to parse AI items list.");
                return;
            }
            parsed.forEach(entry => {
                const prompt = entry.prompt;
                const posArr = entry.pos;
                if (!prompt || !posArr || posArr.length !== 3)
                    return;
                const pos = new vec3(posArr[0], posArr[1], posArr[2]);
                const id = this.generateId(prompt, pos);
                if (!this.localGenerated[id]) {
                    this.localGenerated[id] = true;
                    this.snap3DFactory.createInteractable3DObject(prompt, pos);
                    print(`🌀 Synced AI item: '${prompt}'`);
                }
            });
        };
    }
};
exports.AIItemSyncController = AIItemSyncController;
exports.AIItemSyncController = AIItemSyncController = __decorate([
    component
], AIItemSyncController);
//# sourceMappingURL=AIItemSyncController.js.map