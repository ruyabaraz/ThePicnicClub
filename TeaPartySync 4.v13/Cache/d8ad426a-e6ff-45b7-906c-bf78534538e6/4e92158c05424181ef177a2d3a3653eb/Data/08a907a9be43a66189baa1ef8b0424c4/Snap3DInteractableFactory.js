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
            const outputObj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
            outputObj.name = "Snap3DInteractable - " + input;
            const snap3DInteractable = outputObj.getComponent(Snap3DInteractable_1.Snap3DInteractable.getTypeName());
            if (!snap3DInteractable) {
                print("❌ Missing Snap3DInteractable component.");
                this.avaliableToRequest = true;
                reject("Component missing.");
                return;
            }
            if (overridePosition) {
                outputObj.getTransform().setWorldPosition(overridePosition);
            }
            else {
                const pos = this.wcfmp.getForwardPosition(80);
                outputObj.getTransform().setWorldPosition(pos);
            }
            // 🔁 Poll until snap3DInteractable is fully awake
            const waitUntilAwake = () => {
                if (snap3DInteractable.isAwake) {
                    print("✅ Snap3DInteractable is awake. Sending prompt...");
                    snap3DInteractable.setPrompt(input);
                    Snap3D_1.Snap3D.submitAndGetStatus({
                        prompt: input,
                        format: "glb",
                        refine: this.refineMesh,
                        use_vertex_color: this.useVertexColor,
                    })
                        .then((submitGetStatusResults) => {
                        submitGetStatusResults.event.add(([value, assetOrError]) => {
                            if (value === "image") {
                                snap3DInteractable.setImage(assetOrError.texture);
                            }
                            else if (value === "base_mesh") {
                                snap3DInteractable.setModel(assetOrError.gltfAsset, !this.refineMesh);
                                if (!this.refineMesh) {
                                    this.avaliableToRequest = true;
                                    resolve("✅ Mesh created for: " + input);
                                }
                            }
                            else if (value === "refined_mesh") {
                                snap3DInteractable.setModel(assetOrError.gltfAsset, true);
                                this.avaliableToRequest = true;
                                resolve("✅ Refined mesh created for: " + input);
                            }
                            else if (value === "failed") {
                                print("❌ Snap3D failed: " + assetOrError.errorMsg);
                                this.avaliableToRequest = true;
                                reject("Snap3D failed: " + input);
                            }
                        });
                    })
                        .catch((error) => {
                        print("❌ Snap3D submission error: " + error);
                        snap3DInteractable.onFailure(error);
                        this.avaliableToRequest = true;
                        reject("Snap3D error: " + error);
                    });
                }
                else {
                    (0, FunctionTimingUtils_1.setTimeout)(waitUntilAwake, 50); // Poll every 50ms
                }
            };
            waitUntilAwake();
        });
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