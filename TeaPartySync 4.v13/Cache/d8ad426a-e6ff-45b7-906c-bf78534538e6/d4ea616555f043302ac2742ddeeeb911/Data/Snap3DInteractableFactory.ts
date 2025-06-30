// Snap3DInteractableFactory.ts
import { Snap3D } from "Remote Service Gateway.lspkg/HostedSnap/Snap3D";
import { Snap3DTypes } from "Remote Service Gateway.lspkg/HostedSnap/Snap3DTypes";
import { Snap3DInteractable } from "./Snap3DInteractable";
import WorldCameraFinderProvider from "SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider";
import { setTimeout } from "SpectaclesInteractionKit.lspkg/Utils/FunctionTimingUtils";

@component
export class Snap3DInteractableFactory extends BaseScriptComponent {
  @ui.separator
  @ui.group_start("Submit and Get Status Example")
  @input @widget(new TextAreaWidget()) private prompt: string = "A cute dog wearing a hat";
  @input private refineMesh: boolean = true;
  @input private useVertexColor: boolean = false;
  @ui.group_end
  @input runOnTap: boolean = false;
  @input snap3DInteractablePrefab: ObjectPrefab;

  private avaliableToRequest: boolean = true;
  private wcfmp = WorldCameraFinderProvider.getInstance();

  onAwake() {
    this.createEvent("TapEvent").bind(() => {
      if (this.runOnTap) this.createInteractable3DObject(this.prompt);
    });
  }

  createInteractable3DObject(input: string, overridePosition?: vec3): Promise<string> {
    return new Promise((resolve, reject) => {
      if (!this.avaliableToRequest) return;
      this.avaliableToRequest = false;

      const outputObj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
      const comp = outputObj.getComponent(Snap3DInteractable.getTypeName());
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

          Snap3D.submitAndGetStatus({
            prompt: input,
            format: "glb",
            refine: this.refineMesh,
            use_vertex_color: this.useVertexColor,
          })
            .then((result) => {
              result.event.add(([type, data]) => {
                if (type === "image") comp.setImage((data as Snap3DTypes.TextureAssetData).texture);
                else if (type === "base_mesh") comp.setModel((data as Snap3DTypes.GltfAssetData).gltfAsset, !this.refineMesh);
                else if (type === "refined_mesh") {
                  comp.setModel((data as Snap3DTypes.GltfAssetData).gltfAsset, true);
                  this.avaliableToRequest = true;
                  resolve("Mesh ready");
                } else if (type === "failed") {
                  print("Snap3D error: " + (data as Snap3DTypes.ErrorData).errorMsg);
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
        } else {
          setTimeout(waitUntilAwake, 50);
        }
      };

      waitUntilAwake();
    });
  }
}
