import NativeLogger from "SpectaclesInteractionKit.lspkg/Utils/NativeLogger"

const TAG = "FoodGridContentCreator"
const log = new NativeLogger(TAG)

const Y_START: number = 0
const Y_OFFSET: number = -5.4

@component
export class FoodGridContentCreator extends BaseScriptComponent {
  @input
  objectPrefabs: ObjectPrefab[] = []

  onAwake(): void {
    if (this.objectPrefabs.length === 0) {
      log.f("FoodGridContentCreator: objectPrefabs array is empty!")
    }

    const sceneObj = this.getSceneObject()

    for (let i = 0; i < this.objectPrefabs.length; i++) {
      const prefab = this.objectPrefabs[i]
      const item = prefab.instantiate(sceneObj)

      const screenTransform = item.getComponent("Component.ScreenTransform")
      if (screenTransform) {
        screenTransform.offsets.setCenter(new vec2(0, Y_START + Y_OFFSET * i))
      }

      item.enabled = true // Menüde görünmesini sağlamak için

      // Opsiyonel: Eğer her prefab'ın içinde bir buton varsa, ekstra setup yapılabilir.
    }
  }
}