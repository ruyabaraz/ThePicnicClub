// Snap3DInteractableFactory.ts
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

  @input
  waiterAnimation: AnimationPlayer; // <-- drag your waiter's animation player here

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

      let outputObj = this.snap3DInteractablePrefab.instantiate(this.sceneObject);
      outputObj.name = "Snap3DInteractable - " + input;

      let snap3DInteractable = outputObj.getComponent(Snap3DInteractable.getTypeName());

      if (overridePosition) {
        outputObj.getTransform().setWorldPosition(overridePosition);
      } else {
        let newPos = this.wcfmp.getForwardPosition(80);
        outputObj.getTransform().setWorldPosition(newPos);
      }

      Snap3D.submitAndGetStatus({
        prompt: input,
        format: "glb",
        refine: this.refineMesh,
        use_vertex_color: this.useVertexColor,
      })
        .then((submitGetStatusResults) => {
          submitGetStatusResults.event.add(([value, assetOrError]) => {
            if (value === "image") {
              assetOrError = assetOrError as Snap3DTypes.TextureAssetData;
              snap3DInteractable.setImage(assetOrError.texture);
            } else if (value === "base_mesh") {
              assetOrError = assetOrError as Snap3DTypes.GltfAssetData;
              if (!this.refineMesh) {
                snap3DInteractable.setModel(assetOrError.gltfAsset, true);
                this.stopWaiterAnimation(); // ✅ Stop animation
                this.avaliableToRequest = true;
                resolve("✅ Generated base mesh: " + input);
              } else {
                snap3DInteractable.setModel(assetOrError.gltfAsset, false);
              }
            } else if (value === "refined_mesh") {
              assetOrError = assetOrError as Snap3DTypes.GltfAssetData;
              snap3DInteractable.setModel(assetOrError.gltfAsset, true);
              this.stopWaiterAnimation(); // ✅ Stop animation
              this.avaliableToRequest = true;
              resolve("✅ Generated refined mesh: " + input);
            } else if (value === "failed") {
              assetOrError = assetOrError as Snap3DTypes.ErrorData;
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

  private stopWaiterAnimation() {
    if (this.waiterAnimation) {
      this.waiterAnimation.pause(); // ✅ Correct method
      print("🎬 Waiter animation paused.");
    } else {
      print("⚠️ No waiterAnimation assigned.");
    }
  }
}
