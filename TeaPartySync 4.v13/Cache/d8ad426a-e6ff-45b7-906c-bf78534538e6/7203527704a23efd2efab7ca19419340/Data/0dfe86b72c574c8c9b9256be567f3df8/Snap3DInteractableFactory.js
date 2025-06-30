"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Snap3DInteractableFactory = void 0;
var __selfType = requireType("./Snap3DInteractableFactory");
function component(target) { target.getTypeName = function () { return __selfType; }; }
// Snap3DInteractableFactory.ts
const Snap3D_1 = require("Remote Service Gateway.lspkg/HostedSnap/Snap3D");
const Snap3DInteractable_1 = require("./Snap3DInteractable");
const WorldCameraFinderProvider_1 = require("SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider");
let Snap3DInteractableFactory = class Snap3DInteractableFactory extends BaseScriptComponent {
    onAwake() {
        this.createEvent("TapEvent").bind(() => {
            if (!this.runOnTap)
                return;
            this.createInteractable3DObject(this.prompt);
        });
    }
    createInteractable3DObject(input, overridePosition) {
        return new Promise((resolve, reject) => {
            if (!this.avaliableToRequest) {
                print("⚠️ Already processing a request.");
                return;
            }
            this.avaliableToRequest = false;
            let outputObj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
            outputObj.name = "Snap3DInteractable - " + input;
            let snap3DInteractable = outputObj.getComponent(Snap3DInteractable_1.Snap3DInteractable.getTypeName());
            if (overridePosition) {
                outputObj.getTransform().setWorldPosition(overridePosition);
            }
            else {
                let newPos = this.wcfmp.getForwardPosition(80);
                outputObj.getTransform().setWorldPosition(newPos);
            }
            Snap3D_1.Snap3D.submitAndGetStatus({
                prompt: input,
                format: "glb",
                refine: this.refineMesh,
                use_vertex_color: this.useVertexColor,
            })
                .then((submitGetStatusResults) => {
                submitGetStatusResults.event.add(([value, assetOrError]) => {
                    if (value === "image") {
                        assetOrError = assetOrError;
                        snap3DInteractable.setImage(assetOrError.texture);
                    }
                    else if (value === "base_mesh") {
                        assetOrError = assetOrError;
                        if (!this.refineMesh) {
                            snap3DInteractable.setModel(assetOrError.gltfAsset, true);
                            this.onItemGenerated(); // Stop animation here
                            this.avaliableToRequest = true;
                            resolve("✅ Generated base mesh: " + input);
                        }
                        else {
                            snap3DInteractable.setModel(assetOrError.gltfAsset, false);
                        }
                    }
                    else if (value === "refined_mesh") {
                        assetOrError = assetOrError;
                        snap3DInteractable.setModel(assetOrError.gltfAsset, true);
                        this.onItemGenerated(); // Stop animation here
                        this.avaliableToRequest = true;
                        resolve("✅ Generated refined mesh: " + input);
                    }
                    else if (value === "failed") {
                        assetOrError = assetOrError;
                        print("❌ Error: " + assetOrError.errorMsg);
                        this.avaliableToRequest = true;
                        reject("❌ Failed with prompt: " + input);
                    }
                });
            })
                .catch((error) => {
                snap3DInteractable.onFailure(error);
                print("❌ Submit/Get error: " + error);
                this.avaliableToRequest = true;
                reject("❌ Exception on prompt: " + input);
            });
        });
    }
    onItemGenerated() {
        if (this.waiterAnimation) {
            this.waiterAnimation.enabled = false; // ❌ This stops the legacy Animation Player
            print("🛑 Waiter animation stopped!");
        }
    }
    __initialize() {
        super.__initialize();
        this.avaliableToRequest = true;
        this.wcfmp = WorldCameraFinderProvider_1.default.getInstance();
    }
};
exports.Snap3DInteractableFactory = Snap3DInteractableFactory;
exports.Snap3DInteractableFactory = Snap3DInteractableFactory = __decorate([
    component
], Snap3DInteractableFactory);
//# sourceMappingURL=Snap3DInteractableFactory.js.map