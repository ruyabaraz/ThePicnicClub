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
    validate(this.interactable, "Missing Interactable on button")
    this.interactable.onTriggerEnd.add(this.onPress)
  }

  private onPress = () => {
    if (!this.syncController) return
    this.syncController.setFoodIndex(this.index)
  }
}