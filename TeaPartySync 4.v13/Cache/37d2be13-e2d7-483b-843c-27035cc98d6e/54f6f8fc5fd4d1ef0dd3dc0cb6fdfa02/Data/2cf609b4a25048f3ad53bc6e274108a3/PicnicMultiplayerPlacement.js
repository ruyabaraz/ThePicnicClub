"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PicnicMultiplayerPlacement = void 0;
var __selfType = requireType("./PicnicMultiplayerPlacement");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const SyncEntity_1 = require("SpectaclesSyncKit.lspkg/Core/SyncEntity");
const StorageProperty_1 = require("SpectaclesSyncKit.lspkg/Core/StorageProperty");
const SessionController_1 = require("SpectaclesSyncKit.lspkg/Core/SessionController");
let PicnicMultiplayerPlacement = class PicnicMultiplayerPlacement extends BaseScriptComponent {
    onAwake() {
        this.syncEntity = new SyncEntity_1.SyncEntity(this);
        this.syncEntity.addStorageProperty(this.picnicPositionProp);
        this.syncEntity.addStorageProperty(this.picnicRotationProp);
        this.syncEntity.notifyOnReady(() => {
            const isHost = SessionController_1.SessionController.getInstance().isHost();
            if (isHost) {
                print("👑 Host: Starting surface detection");
                this.surfaceDetection.startGroundCalibration((pos, rot) => {
                    print("📦 Host placed picnic. Syncing...");
                    this.picnicPositionProp.setPendingValue(pos);
                    this.picnicRotationProp.setPendingValue(rot);
                    this.placePicnic(pos, rot);
                });
            }
            else {
                print("👥 Guest: Waiting for synced picnic placement");
                this.surfaceDetection.getSceneObject().enabled = false;
                this.picnicPositionProp.onAnyChange.add((newPos) => {
                    const newRot = this.picnicRotationProp.currentValue;
                    this.placePicnic(newPos, newRot);
                    print("📥 Guest placed picnic at synced position.");
                });
            }
        });
    }
    placePicnic(pos, rot) {
        const t = this.picnicRoot.getTransform();
        t.setWorldPosition(pos);
        t.setWorldRotation(rot);
    }
    __initialize() {
        super.__initialize();
        this.picnicPositionProp = StorageProperty_1.StorageProperty.manualVec3("picnicPos", vec3.zero());
        this.picnicRotationProp = StorageProperty_1.StorageProperty.manualQuat("picnicRot", quat.quatIdentity());
    }
};
exports.PicnicMultiplayerPlacement = PicnicMultiplayerPlacement;
exports.PicnicMultiplayerPlacement = PicnicMultiplayerPlacement = __decorate([
    component
], PicnicMultiplayerPlacement);
//# sourceMappingURL=PicnicMultiplayerPlacement.js.map