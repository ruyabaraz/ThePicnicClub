import { Interactable } from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable"
import { validate } from "SpectaclesInteractionKit.lspkg/Utils/validate"

@component
export class FoodMenuButton extends BaseScriptComponent {
  @input
  prefabToEnable!: SceneObject

  private interactable: Interactable | null = null

  onAwake(): void {
    this.interactable = this.getSceneObject().getComponent(Interactable.getTypeName()) as Interactable
    validate(this.interactable, "No Interactable found on menu button.")
    this.interactable.onTriggerEnd.add(this.onButtonPressed)
  }

  private onButtonPressed = (): void => {
    if (!this.prefabToEnable) return

    // Prefab aktif olsun
    this.prefabToEnable.enabled = true

    // Eğer içinde bir Behavior varsa (örneğin animasyon başlatan), otomatik çalışır
    print("Enabled: " + this.prefabToEnable.name)
  }
}