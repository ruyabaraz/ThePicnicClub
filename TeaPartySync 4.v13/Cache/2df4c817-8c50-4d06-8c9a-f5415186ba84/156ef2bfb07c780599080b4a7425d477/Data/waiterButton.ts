//@input Component.ScriptComponent foodSyncController

function onPressed() {
  print("🖱️ Waiter button pressed")
  script.foodSyncController.api.showFood("waiter")
}

script.createEvent("TapEvent").bind(onPressed)
