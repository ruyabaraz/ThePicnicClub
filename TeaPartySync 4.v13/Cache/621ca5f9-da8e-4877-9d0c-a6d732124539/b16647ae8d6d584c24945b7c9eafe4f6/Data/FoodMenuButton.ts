import { Interactable } from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable"
import { validate } from "SpectaclesInteractionKit.lspkg/Utils/validate"
import { FoodSyncController } from "./FoodSyncController"

@component
export class FoodMenuButton extends BaseScriptComponent {
  @input syncController!: FoodSyncController
  @input index: number = -1

  private interactable: Interactable | null = null

  onAwake(): void {
    this.interactable = this.getSceneObject().getComponent(Interactable.getTypeName()) as Interactable
    validate(this.interactable, "No Interactable found on menu button.")
    this.interactable.onTriggerEnd.add(this.onButtonPressed)
  }

  private onButtonPressed = (): void => {
    if (!this.syncController) return

    // Only sync the index — do not enable anything directly
    this.syncController.setFoodIndex(this.index)

    print(`Synced selection: ${this.index}`)
  }
}