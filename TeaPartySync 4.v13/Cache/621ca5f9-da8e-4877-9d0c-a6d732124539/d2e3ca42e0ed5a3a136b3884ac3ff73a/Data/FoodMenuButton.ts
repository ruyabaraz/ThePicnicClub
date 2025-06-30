import { Interactable } from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable"
import { validate } from "SpectaclesInteractionKit.lspkg/Utils/validate"
import { FoodSyncController } from "./FoodSyncController" // Adjust path as needed

@component
export class FoodMenuButton extends BaseScriptComponent {
  @input prefabToEnable!: SceneObject
  @input index: number = -1 // Index of this menu item in the sync list

  private interactable: Interactable | null = null

  onAwake(): void {
    this.interactable = this.getComponent(Interactable.getTypeName()) as Interactable
    validate(this.interactable, "No Interactable found on menu button.")

    this.interactable.onTriggerEnd.add(this.onButtonPressed)
  }

  private onButtonPressed = (): void => {
    if (!this.prefabToEnable) return

    // Enable the local prefab
    this.prefabToEnable.enabled = true

    // If prefab has Behavior, it will run automatically
    print("Enabled: " + this.prefabToEnable.name)

    // Sync this selection across users
    const syncController = global.foodSyncController as FoodSyncController
    if (syncController && this.index >= 0) {
      syncController.setFoodIndex(this.index)
    } else {
      print("No sync controller found or invalid index")
    }
  }
}