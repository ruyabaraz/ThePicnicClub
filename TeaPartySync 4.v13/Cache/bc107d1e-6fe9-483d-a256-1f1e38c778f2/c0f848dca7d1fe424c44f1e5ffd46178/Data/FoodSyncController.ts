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

    this.foodStateProp.onAnyChange.add((val) => this.applyFoodState(val))
    this.syncEntity.notifyOnReady(() => this.applyFoodState(this.foodStateProp.currentValue))
  }

  public toggleFood(name: string) {
    this.foodStates[name] = !this.foodStates[name]
    this.syncToProperty()
  }

  private applyFoodState(stateStr: string) {
    try {
      this.foodStates = JSON.parse(stateStr)
    } catch {
      this.foodStates = {}
    }

    for (let i = 0; i < this.foodNames.length; i++) {
      const name = this.foodNames[i]
      const isOn = !!this.foodStates[name]
      this.foodPrefabs[i].enabled = isOn
    }
  }

  private syncToProperty() {
    this.foodStateProp.setPendingValue(JSON.stringify(this.foodStates))
  }
}