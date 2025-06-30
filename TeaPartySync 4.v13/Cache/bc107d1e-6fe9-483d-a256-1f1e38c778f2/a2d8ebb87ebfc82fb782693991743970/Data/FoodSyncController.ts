import { StorageProperty } from "SpectaclesSyncKit.lspkg/Core/StorageProperty"
import { SyncEntity } from "SpectaclesSyncKit.lspkg/Core/SyncEntity"
import { SessionController } from "SpectaclesSyncKit.lspkg/Core/SessionController"

@component
export class FoodSyncController extends BaseScriptComponent {
  @input foodPrefabs: SceneObject[] = []

  private syncEntity: SyncEntity
  private selectedIndexProp = StorageProperty.manualInt("selectedFoodIndex", -1)

  onAwake(): void {
    this.syncEntity = new SyncEntity(this)
    this.syncEntity.addStorageProperty(this.selectedIndexProp)

    this.selectedIndexProp.onAnyChange.add((newVal: number) => this.updateSelection(newVal))
    this.syncEntity.notifyOnReady(() => {
      // Re-apply current selection on join
      this.updateSelection(this.selectedIndexProp.currentValue)
    })
  }

  public setFoodIndex(index: number) {
    if (index >= 0 && index < this.foodPrefabs.length) {
      this.selectedIndexProp.setPendingValue(index)
    }
  }

  private updateSelection(index: number) {
    for (let i = 0; i < this.foodPrefabs.length; i++) {
      this.foodPrefabs[i].enabled = (i === index)
    }
  }
}