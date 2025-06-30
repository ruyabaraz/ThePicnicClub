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
      if (!this.runOnTap) {
        return;
      }
      this.createInteractable3DObject(this.prompt);
    });
  }

  createInteractable3DObject(
    input: string,
    overridePosition?: vec3
  ): Promise<string> {
    return new Promise((resolve, reject) => {
      if (!this.avaliableToRequest) {
        print("⚠️ Already processing a request. Please wait.");
        return;
      }

      this.avaliableToRequest = false;

      const outputObj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
      outputObj.name = "Snap3DInteractable - " + input;

      const snap3DInteractable = outputObj.getComponent(
        Snap3DInteractable.getTypeName()
      );

      if (!snap3DInteractable) {
        print("❌ Failed to get Snap3DInteractable component.");
        this.avaliableToRequest = true;
        reject("Component missing");
        return;
      }

      if (overridePosition) {
        outputObj.getTransform().setWorldPosition(overridePosition);
      } else {
        const newPos = this.wcfmp.getForwardPosition(80);
        outputObj.getTransform().setWorldPosition(newPos);
      }

      print("📦 Instantiated Snap3DInteractable. Waiting for isAwake...");

      // Start polling loop
      const waitUntilAwake = () => {
        if (snap3DInteractable.isAwake) {
          print("✅ Snap3DInteractable isAwake = true. Submitting request...");

          Snap3D.submitAndGetStatus({
            prompt: input,
            format: "glb",
            refine: this.refineMesh,
            use_vertex_color: this.useVertexColor,
          })
            .then((submitGetStatusResults) => {
              submitGetStatusResults.event.add(([value, assetOrError]) => {
                print("📥 Snap3D result received: " + value);

                if (value === "image") {
                  const imageData = assetOrError as Snap3DTypes.TextureAssetData;
                  snap3DInteractable.setImage(imageData.texture);
                } else if (value === "base_mesh") {
                  const meshData = assetOrError as Snap3DTypes.GltfAssetData;
                  if (!this.refineMesh) {
                    snap3DInteractable.setModel(meshData.gltfAsset, true);
                    this.avaliableToRequest = true;
                    resolve("✅ Created mesh from prompt: " + input);
                  } else {
                    snap3DInteractable.setModel(meshData.gltfAsset, false);
                  }
                } else if (value === "refined_mesh") {
                  const refinedData = assetOrError as Snap3DTypes.GltfAssetData;
                  snap3DInteractable.setModel(refinedData.gltfAsset, true);
                  this.avaliableToRequest = true;
                  resolve("✅ Created refined mesh from prompt: " + input);
                } else if (value === "failed") {
                  const err = assetOrError as Snap3DTypes.ErrorData;
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
        } else {
          // Keep polling every 50ms
          setTimeout(waitUntilAwake, 50);
        }
      };

      waitUntilAwake();
    });
  }

  private onTap() {}
}
