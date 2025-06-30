import { Snap3D } from "Remote Service Gateway.lspkg/HostedSnap/Snap3D";
import { Snap3DTypes } from "Remote Service Gateway.lspkg/HostedSnap/Snap3DTypes";
import { Snap3DInteractable } from "./Snap3DInteractable";
import WorldCameraFinderProvider from "SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider";
import { setTimeout } from "SpectaclesInteractionKit.lspkg/Utils/FunctionTimingUtils";

@component
export class Snap3DInteractableFactory extends BaseScriptComponent {
  @ui.separator
  @ui.group_start("Submit and Get Status Example")
  @input
  @widget(new TextAreaWidget())
  private prompt: string = "A cute dog wearing a hat";
  @input
  private refineMesh: boolean = true;
  @input
  private useVertexColor: boolean = false;
  @ui.group_end
  @input
  runOnTap: boolean = false;

  @input
  snap3DInteractablePrefab: ObjectPrefab;

  private avaliableToRequest: boolean = true;
  private wcfmp = WorldCameraFinderProvider.getInstance();

  onAwake() {
    this.createEvent("TapEvent").bind(() => {
      if (!this.runOnTap) return;
      this.createInteractable3DObject(this.prompt);
    });
  }

  createInteractable3DObject(input: string, overridePosition?: vec3): Promise<string> {
    return new Promise((resolve, reject) => {
      if (!this.avaliableToRequest) {
        print("⚠️ Already processing a request.");
        return;
      }

      this.avaliableToRequest = false;

      const outputObj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
      outputObj.name = "Snap3DInteractable - " + input;

      const snap3DInteractable = outputObj.getComponent(Snap3DInteractable.getTypeName());
      if (!snap3DInteractable) {
        print("❌ Missing Snap3DInteractable component.");
        this.avaliableToRequest = true;
        reject("Component missing.");
        return;
      }

      if (overridePosition) {
        outputObj.getTransform().setWorldPosition(overridePosition);
      } else {
        const pos = this.wcfmp.getForwardPosition(80);
        outputObj.getTransform().setWorldPosition(pos);
      }

      // 🔁 Poll until snap3DInteractable is fully awake
      const waitUntilAwake = () => {
        if (snap3DInteractable.isAwake) {
          print("✅ Snap3DInteractable is awake. Sending prompt...");

          snap3DInteractable.setPrompt(input);

          Snap3D.submitAndGetStatus({
            prompt: input,
            format: "glb",
            refine: this.refineMesh,
            use_vertex_color: this.useVertexColor,
          })
            .then((submitGetStatusResults) => {
              submitGetStatusResults.event.add(([value, assetOrError]) => {
                if (value === "image") {
                  snap3DInteractable.setImage((assetOrError as Snap3DTypes.TextureAssetData).texture);
                } else if (value === "base_mesh") {
                  snap3DInteractable.setModel((assetOrError as Snap3DTypes.GltfAssetData).gltfAsset, !this.refineMesh);
                  if (!this.refineMesh) {
                    this.avaliableToRequest = true;
                    resolve("✅ Mesh created for: " + input);
                  }
                } else if (value === "refined_mesh") {
                  snap3DInteractable.setModel((assetOrError as Snap3DTypes.GltfAssetData).gltfAsset, true);
                  this.avaliableToRequest = true;
                  resolve("✅ Refined mesh created for: " + input);
                } else if (value === "failed") {
                  print("❌ Snap3D failed: " + (assetOrError as Snap3DTypes.ErrorData).errorMsg);
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

        } else {
          setTimeout(waitUntilAwake, 50); // Poll every 50ms
        }
      };

      waitUntilAwake();
    });
  }
}
