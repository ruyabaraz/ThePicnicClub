// InteractableSnap3DGenerator.ts
import { ASRQueryController } from "./ASRQueryController";
import { Snap3DInteractableFactory } from "./Snap3DInteractableFactory";

@component
export class InteractableImageGenerator extends BaseScriptComponent {
  @input snap3DFactory: Snap3DInteractableFactory;
  @input private asrQueryController: ASRQueryController;
  @input private targetPosition: SceneObject;

  onAwake() {
    this.createEvent("OnStartEvent").bind(() => {
      this.asrQueryController.onQueryEvent.add((query) => {
        const pos = this.targetPosition.getTransform().getWorldPosition();
        this.snap3DFactory.createInteractable3DObject(query, pos)
          .then((msg) => print("✅ 3D Object created: " + msg))
          .catch((err) => print("❌ 3D Object creation failed: " + err));
      });
    });
  }
}
