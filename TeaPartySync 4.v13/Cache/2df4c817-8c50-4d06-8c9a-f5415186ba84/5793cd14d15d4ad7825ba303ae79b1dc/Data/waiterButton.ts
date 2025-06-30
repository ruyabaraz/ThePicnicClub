@component
export class WaiterButton extends BaseScriptComponent {
  @input foodSyncController: Component.ScriptComponent

  onStart() {
    this.getSceneObject().createEvent("TapEvent").bind(() => {
      print("🖱️ Waiter button pressed")
      const controller = this.foodSyncController.api
      if (controller && controller.showFood) {
        controller.showFood("waiter")
      } else {
        print("⚠️ foodSyncController API not found or showFood is missing.")
      }
    })
  }
}
