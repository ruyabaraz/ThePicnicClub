@component
export class SummonWaiter extends BaseScriptComponent {
  @input waiterPrefab!: SceneObject
  @input objectToHide!: SceneObject

  public showWaiter(): void {
    if (this.waiterPrefab) {
      this.waiterPrefab.enabled = true
      print("🍽️ Waiter appeared!")
    } else {
      print("❌ Waiter prefab not assigned")
    }

    if (this.objectToHide) {
      this.objectToHide.enabled = false
      print("🙈 Hiding object: " + this.objectToHide.name)
    }
  }
}
