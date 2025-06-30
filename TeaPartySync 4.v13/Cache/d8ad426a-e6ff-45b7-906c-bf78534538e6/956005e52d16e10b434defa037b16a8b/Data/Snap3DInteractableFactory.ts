import { Snap3D } from "Remote Service Gateway.lspkg/HostedSnap/Snap3D";
import { Snap3DTypes } from "Remote Service Gateway.lspkg/HostedSnap/Snap3DTypes";
import { Snap3DInteractable } from "./Snap3DInteractable";
import WorldCameraFinderProvider from "SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider";

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
        print("Already processing a request. Please wait.");
        return;
      }

      this.avaliableToRequest = false;

      const outputObj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
      outputObj.name = "Snap3DInteractable - " + input;

      const snap3DInteractable = outputObj.getComponent(
        Snap3DInteractable.getTypeName()
      );

      if (overridePosition) {
        outputObj.getTransform().setWorldPosition(overridePosition);
      } else {
        const newPos = this.wcfmp.getForwardPosition(80);
        outputObj.getTransform().setWorldPosition(newPos);
      }

      // Wait for OnStartEvent to ensure component is awake
      snap3DInteractable.createEvent("OnStartEvent").bind(() => {
        Snap3D.submitAndGetStatus({
          prompt: input,
          format: "glb",
          refine: this.refineMesh,
          use_vertex_color: this.useVertexColor,
        })
          .then((submitGetStatusResults) => {
            submitGetStatusResults.event.add(([value, assetOrError]) => {
              if (value === "image") {
                const imageData = assetOrError as Snap3DTypes.TextureAssetData;
                snap3DInteractable.setImage(imageData.texture);
              } else if (value === "base_mesh") {
                const meshData = assetOrError as Snap3DTypes.GltfAssetData;
                if (!this.refineMesh) {
                  snap3DInteractable.setModel(meshData.gltfAsset, true);
                  this.avaliableToRequest = true;
                  resolve("Successfully created mesh with prompt: " + input);
                } else {
                  snap3DInteractable.setModel(meshData.gltfAsset, false);
                }
              } else if (value === "refined_mesh") {
                const refinedData = assetOrError as Snap3DTypes.GltfAssetData;
                snap3DInteractable.setModel(refinedData.gltfAsset, true);
                this.avaliableToRequest = true;
                resolve("Successfully created mesh with prompt: " + input);
              } else if (value === "failed") {
                const err = assetOrError as Snap3DTypes.ErrorData;
                print("Error: " + err.errorMsg);
                this.avaliableToRequest = true;
                reject("Failed to create mesh with prompt: " + input);
              }
            });
          })
          .catch((error) => {
            snap3DInteractable.onFailure(error);
            print("Error submitting task or getting status: " + error);
            this.avaliableToRequest = true;
            reject("Failed to create mesh with prompt: " + input);
          });
      });
    });
  }

  private onTap() {}
}
