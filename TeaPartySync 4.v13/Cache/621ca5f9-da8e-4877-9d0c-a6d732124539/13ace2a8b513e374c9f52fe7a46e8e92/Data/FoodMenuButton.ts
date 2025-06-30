import { Interactable } from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable"
import { validate } from "SpectaclesInteractionKit.lspkg/Utils/validate"

@component
export class FoodMenuButton extends BaseScriptComponent {
  @input
  prefabToEnable!: SceneObject

  @input
  basketLid?: SceneObject // Opsiyonel olarak kapak eklenebilir

  private interactable: Interactable | null = null

  onAwake(): void {
    this.interactable = this.getComponent(Interactable.getTypeName()) as Interactable
    validate(this.interactable, "No Interactable found on menu button.")
    this.interactable.onTriggerEnd.add(this.onButtonPressed)
  }

  private onButtonPressed = (): void => {
    if (!this.prefabToEnable) return

    // Prefab'ı aktif et
    this.prefabToEnable.enabled = true
    print("Enabled: " + this.prefabToEnable.name)

    // İçinde AnimationPlayer varsa, çalıştır
    const animPlayer = this.prefabToEnable.getComponent("AnimationPlayer") as AnimationPlayer
    if (animPlayer) {
      animPlayer.play(0) // Track 0 oynatılıyor
      print("Animation started on: " + this.prefabToEnable.name)
    }

    // Sepet kapağı varsa onun da animasyonunu oynat
    if (this.basketLid) {
      const lidAnim = this.basketLid.getComponent("AnimationPlayer") as AnimationPlayer
      if (lidAnim) {
        this.basketLid.enabled = true
        lidAnim.play(0)
        print("Basket lid animation started!")
      }
    }
  }
}