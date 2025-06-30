// Snap3DInteractable.ts
import { setTimeout } from "SpectaclesInteractionKit.lspkg/Utils/FunctionTimingUtils";

@component
export class Snap3DInteractable extends BaseScriptComponent {
  @input private modelParent: SceneObject;
  @input private spinner: SceneObject;
  @input private mat: Material;
  @input private displayPlate: SceneObject;
  @input private colliderObj: SceneObject;

  public isAwake: boolean = false;

  private tempModel: SceneObject = null;
  private finalModel: SceneObject = null;
  private size: number = 20;
  private sizeVec: vec3 = null;

  onAwake() {
    this.spinner.enabled = true; // keep spinner
    this.sizeVec = vec3.one().uniformScale(this.size);

    this.displayPlate
      .getTransform()
      .setLocalPosition(new vec3(0, -this.size * 0.5, 0));
    this.colliderObj.getTransform().setLocalScale(this.sizeVec);

    this.isAwake = true;
    print("✅ Snap3DInteractable is fully awake");
  }

  setModel(model: GltfAsset, isFinal: boolean) {
    if (isFinal) {
      if (!isNull(this.finalModel)) this.finalModel.destroy();
      this.spinner.enabled = false;
      this.finalModel = model.tryInstantiate(this.modelParent, this.mat);
      this.finalModel.getTransform().setLocalScale(this.sizeVec);
    } else {
      this.tempModel = model.tryInstantiate(this.modelParent, this.mat);
      this.tempModel.getTransform().setLocalScale(this.sizeVec);
    }
  }

  onFailure(error: string) {
    this.spinner.enabled = false;
    if (this.tempModel) this.tempModel.destroy();
    if (this.finalModel) this.finalModel.destroy();
    print("❌ Model generation failed: " + error);
    setTimeout(() => this.destroy(), 5000);
  }
}
