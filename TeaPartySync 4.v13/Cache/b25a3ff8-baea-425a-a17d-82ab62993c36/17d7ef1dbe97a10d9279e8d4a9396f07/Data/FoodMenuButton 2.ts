import { Interactable } from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable"
import { validate } from "SpectaclesInteractionKit.lspkg/Utils/validate"
import { FoodSyncController } from "./FoodSyncController"

@component
export class FoodMenuButton extends BaseScriptComponent {
  @input prefabToEnable!: SceneObject
  @input syncController!: FoodSyncController
  @input index: number = -1

  private interactable: Interactable | null = null

  onAwake(): void {
    this.interactable = this.getSceneObject().getComponent(Interactable.getTypeName()) as Interactable
    validate(this.interactable, "No Interactable found on menu button.")
    this.interactable.onTriggerEnd.add(this.onButtonPressed)
  }

  private onButtonPressed = (): void => {
    if (!this.prefabToEnable || !this.syncController) return

    // Locally enable the prefab
    this.prefabToEnable.enabled = true

    // Send selection to sync
    this.syncController.setFoodIndex(this.index)

    print(`Button pressed: ${this.index} - ${this.prefabToEnable.name}`)
  }
}