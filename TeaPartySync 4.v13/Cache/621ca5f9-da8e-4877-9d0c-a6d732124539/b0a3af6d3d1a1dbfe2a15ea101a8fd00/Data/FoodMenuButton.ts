import { Interactable } from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable"
import { validate } from "SpectaclesInteractionKit.lspkg/Utils/validate"
import { FoodSyncController } from "./FoodSyncController"

@component
export class FoodMenuButton extends BaseScriptComponent {
  @input syncController!: FoodSyncController
  @input foodName: string = ""

  private interactable: Interactable

  onAwake(): void {
    this.interactable = this.getSceneObject().getComponent(Interactable.getTypeName()) as Interactable
    validate(this.interactable, "Missing Interactable")
    this.interactable.onTriggerEnd.add(this.onPressed)
  }

  private onPressed = () => {
    if (this.syncController && this.foodName) {
      this.syncController.toggleFood(this.foodName)
    }
  }
}