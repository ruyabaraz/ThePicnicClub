@component
export class SummonWaiter extends BaseScriptComponent {
  @input waiterPrefab!: SceneObject

  public showWaiter(): void {
    if (this.waiterPrefab) {
      this.waiterPrefab.enabled = true
      print("🍽️ Waiter appeared!")
    } else {
      print("❌ Waiter prefab not assigned")
    }
  }
}
