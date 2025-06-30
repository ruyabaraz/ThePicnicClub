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
const FunctionTimingUtils_1 = require("SpectaclesInteractionKit.lspkg/Utils/FunctionTimingUtils");
let Snap3DInteractableFactory = class Snap3DInteractableFactory extends BaseScriptComponent {
    onAwake() {
        this.createEvent("TapEvent").bind(() => {
            if (this.runOnTap)
                this.createInteractable3DObject(this.prompt);
        });
    }
    createInteractable3DObject(input, overridePosition) {
        return new Promise((resolve, reject) => {
            if (!this.avaliableToRequest)
                return;
            this.avaliableToRequest = false;
            const outputObj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
            const comp = outputObj.getComponent(Snap3DInteractable_1.Snap3DInteractable.getTypeName());
            if (!comp) {
                print("❌ Snap3DInteractable not found");
                this.avaliableToRequest = true;
                reject("Component missing");
                return;
            }
            const pos = overridePosition || this.wcfmp.getForwardPosition(80);
            outputObj.getTransform().setWorldPosition(pos);
            const waitUntilAwake = () => {
                if (comp.isAwake) {
                    comp.setPrompt(input);
                    Snap3D_1.Snap3D.submitAndGetStatus({
                        prompt: input,
                        format: "glb",
                        refine: this.refineMesh,
                        use_vertex_color: this.useVertexColor,
                    })
                        .then((result) => {
                        result.event.add(([type, data]) => {
                            if (type === "image")
                                comp.setImage(data.texture);
                            else if (type === "base_mesh")
                                comp.setModel(data.gltfAsset, !this.refineMesh);
                            else if (type === "refined_mesh") {
                                comp.setModel(data.gltfAsset, true);
                                this.avaliableToRequest = true;
                                resolve("Mesh ready");
                            }
                            else if (type === "failed") {
                                print("Snap3D error: " + data.errorMsg);
                                this.avaliableToRequest = true;
                                reject("Snap3D failed");
                            }
                        });
                    })
                        .catch((err) => {
                        comp.onFailure(err);
                        this.avaliableToRequest = true;
                        reject(err);
                    });
                }
                else {
                    (0, FunctionTimingUtils_1.setTimeout)(waitUntilAwake, 50);
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