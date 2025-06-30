import { Interactable } from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable"
import { validate } from "SpectaclesInteractionKit.lspkg/Utils/validate"

@component
export class FoodMenuButton extends BaseScriptComponent {
  @input prefabToEnable!: SceneObject

  private interactable: Interactable

  onAwake(): void {
    this.interactable = this.getSceneObject().getComponent(Interactable.getTypeName()) as Interactable
    validate(this.interactable, "No Interactable found on button.")
    this.interactable.onTriggerEnd.add(this.onButtonPressed)
  }

  private onButtonPressed = (): void => {
    if (!this.prefabToEnable) return

    this.prefabToEnable.enabled = true
    print("Enabled prefab: " + this.prefabToEnable.name)
  }
}