import { SyncEntity } from "SpectaclesSyncKit.lspkg/Core/SyncEntity"
import { StorageProperty } from "SpectaclesSyncKit.lspkg/Core/StorageProperty"

@component
export class FoodSyncController extends BaseScriptComponent {
  @input foodPrefabs: SceneObject[] = []
  @input foodNames: string[] = []

  private syncEntity: SyncEntity
  private foodStateProp = StorageProperty.manualString("foodStates", "")

  private foodStates: Record<string, boolean> = {}

  onAwake(): void {
    this.syncEntity = new SyncEntity(this)
    this.syncEntity.addStorageProperty(this.foodStateProp)

    this.foodStateProp.onAnyChange.add(this.applyFoodState)
    this.syncEntity.notifyOnReady(() => this.applyFoodState(this.foodStateProp.currentValue))
  }

  public showFood(name: string) {
    if (!name) {
      print("⚠️ showFood called with empty name.")
      return
    }

    if (this.foodStates[name]) {
      print(`✅ '${name}' already shown. Skipping.`)
      return
    }

    this.foodStates[name] = true
    this.syncToProperty()
  }

  private applyFoodState = (stateStr: string) => {
    let parsed: any = {}

    try {
      parsed = JSON.parse(stateStr)
      if (!parsed || typeof parsed !== "object") throw new Error()
    } catch {
      print("⚠️ Could not parse foodStates. Resetting to empty.")
      parsed = {}
    }

    this.foodStates = parsed

    for (let i = 0; i < this.foodNames.length; i++) {
      const name = this.foodNames[i]
      const prefab = this.foodPrefabs[i]

      if (!name) {
        print(`⚠️ foodNames[${i}] is empty or undefined.`)
        continue
      }

      if (!prefab) {
        print(`⚠️ Missing prefab for '${name}' at index ${i}.`)
        continue
      }

      const isOn = !!this.foodStates[name]
      prefab.enabled = isOn

      print(`🔁 '${name}' set to ${isOn}`)
    }
  }

  private syncToProperty() {
    try {
      const json = JSON.stringify(this.foodStates)
      this.foodStateProp.setPendingValue(json)
    } catch (e) {
      print("⚠️ Failed to stringify foodStates: " + e)
    }
  }
}