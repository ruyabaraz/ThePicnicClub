@component
export class WaiterButton extends BaseScriptComponent {
  @input
  foodSyncController: any // or type as specific script class if available

  onStart(): void {
    this.createEvent("TapEvent").bind(() => {
      print("🖱️ Waiter button tapped.")

      if (!this.foodSyncController || !this.foodSyncController.api) {
        print("⚠️ No valid foodSyncController or missing API.")
        return
      }

      const controller = this.foodSyncController.api

      if (typeof controller.showFood === "function") {
        controller.showFood("waiter")
      } else {
        print("⚠️ showFood() not found on foodSyncController.")
      }
    })
  }
}
