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
const Snap3D_1 = require("Remote Service Gateway.lspkg/HostedSnap/Snap3D");
const Snap3DInteractable_1 = require("./Snap3DInteractable");
const WorldCameraFinderProvider_1 = require("SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider");
const FunctionTimingUtils_1 = require("SpectaclesInteractionKit.lspkg/Utils/FunctionTimingUtils");
let Snap3DInteractableFactory = class Snap3DInteractableFactory extends BaseScriptComponent {
    onAwake() {
        this.createEvent("TapEvent").bind(() => {
            if (!this.runOnTap) {
                return;
            }
            this.createInteractable3DObject(this.prompt);
        });
    }
    createInteractable3DObject(input, overridePosition) {
        return new Promise((resolve, reject) => {
            if (!this.avaliableToRequest) {
                print("⚠️ Already processing a request. Please wait.");
                return;
            }
            this.avaliableToRequest = false;
            const outputObj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
            outputObj.name = "Snap3DInteractable - " + input;
            const snap3DInteractable = outputObj.getComponent(Snap3DInteractable_1.Snap3DInteractable.getTypeName());
            if (!snap3DInteractable) {
                print("❌ Failed to get Snap3DInteractable component.");
                this.avaliableToRequest = true;
                reject("Component missing");
                return;
            }
            if (overridePosition) {
                outputObj.getTransform().setWorldPosition(overridePosition);
            }
            else {
                const newPos = this.wcfmp.getForwardPosition(80);
                outputObj.getTransform().setWorldPosition(newPos);
            }
            print("📦 Instantiated Snap3DInteractable. Waiting for it to be awake...");
            snap3DInteractable.createEvent("OnStartEvent").bind(() => {
                print("✅ Snap3DInteractable is awake. Submitting Snap3D request...");
                Snap3D_1.Snap3D.submitAndGetStatus({
                    prompt: input,
                    format: "glb",
                    refine: this.refineMesh,
                    use_vertex_color: this.useVertexColor,
                })
                    .then((submitGetStatusResults) => {
                    submitGetStatusResults.event.add(([value, assetOrError]) => {
                        print("📥 Snap3D result received: " + value);
                        if (value === "image") {
                            const imageData = assetOrError;
                            snap3DInteractable.setImage(imageData.texture);
                        }
                        else if (value === "base_mesh") {
                            const meshData = assetOrError;
                            if (!this.refineMesh) {
                                snap3DInteractable.setModel(meshData.gltfAsset, true);
                                this.avaliableToRequest = true;
                                resolve("✅ Created mesh from prompt: " + input);
                            }
                            else {
                                snap3DInteractable.setModel(meshData.gltfAsset, false);
                            }
                        }
                        else if (value === "refined_mesh") {
                            const refinedData = assetOrError;
                            snap3DInteractable.setModel(refinedData.gltfAsset, true);
                            this.avaliableToRequest = true;
                            resolve("✅ Created refined mesh from prompt: " + input);
                        }
                        else if (value === "failed") {
                            const err = assetOrError;
                            print("❌ Snap3D failed: " + err.errorMsg);
                            this.avaliableToRequest = true;
                            reject("Snap3D failed: " + err.errorMsg);
                        }
                    });
                })
                    .catch((error) => {
                    print("❌ Snap3D submit error: " + error);
                    snap3DInteractable.onFailure(error);
                    this.avaliableToRequest = true;
                    reject("Failed to create mesh with prompt: " + input);
                });
            });
            // Optional fallback if OnStartEvent never triggers
            (0, FunctionTimingUtils_1.setTimeout)(() => {
                if (!snap3DInteractable.getSceneObject().enabled) {
                    print("⚠️ OnStartEvent never fired — prefab might be broken.");
                    this.avaliableToRequest = true;
                    reject("Prefab never activated properly.");
                }
            }, 5000);
        });
    }
    onTap() { }
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