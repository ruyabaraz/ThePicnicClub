import { Interactable } from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable"
import { validate } from "SpectaclesInteractionKit.lspkg/Utils/validate"
import { FoodSyncController } from "./FoodSyncController"

@component
export class FoodMenuButton extends BaseScriptComponent {
  @input
  prefabToEnable!: SceneObject

  @input
  index: number = -1 // Index of this button in the food prefab list

  private interactable: Interactable | null = null

  onAwake(): void {
    this.interactable = this.getComponent(Interactable.getTypeName()) as Interactable
    validate(this.interactable, "No Interactable found on menu button.")
    this.interactable.onTriggerEnd.add(this.onButtonPressed)
  }

  private onButtonPressed = (): void => {
    if (!this.prefabToEnable || this.index < 0) return

    // Enable locally
    this.prefabToEnable.enabled = true
    print("Enabled: " + this.prefabToEnable.name)

    // Sync to other users via FoodSyncController
    const syncController = global.foodSyncController as FoodSyncController
    if (syncController) {
      syncController.setFoodIndex(this.index)
      print("Synced index: " + this.index)
    } else {
      print("FoodSyncController not found.")
    }
  }
}