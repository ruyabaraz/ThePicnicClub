import { SurfacePlacementHelper } from "SpectaclesInteractionKit.lspkg/Components/ARPlacement/SurfacePlacementHelper"
import { SyncEntity } from "SpectaclesSyncKit.lspkg/Core/SyncEntity"
import { StorageProperty } from "SpectaclesSyncKit.lspkg/Core/StorageProperty"
import { SessionController } from "SpectaclesSyncKit.lspkg/Core/SessionController"

@component
export class PicnicPlacementController extends BaseScriptComponent {
  @input picnicRoot!: SceneObject
  @input placementHelper!: SurfacePlacementHelper

  private syncEntity: SyncEntity
  private picnicTransformProp = StorageProperty.manualTransform("picnicTransform", this.picnicRoot.getTransform())

  onAwake(): void {
    this.syncEntity = new SyncEntity(this)
    this.syncEntity.addStorageProperty(this.picnicTransformProp)

    this.syncEntity.notifyOnReady(() => {
      if (SessionController.instance.isHost()) {
        print("👑 I am host — surface detection enabled")
        this.placementHelper.enabled = true

        this.placementHelper.onPlacementConfirmed.add(() => {
          print("📦 Placed picnic root on surface")
          this.picnicTransformProp.setPendingValue(this.picnicRoot.getTransform())
        })

      } else {
        print("👥 I am not host — waiting for synced position")
        this.placementHelper.enabled = false

        this.picnicTransformProp.onAnyChange.add((newTransform) => {
          this.picnicRoot.getTransform().setWorldTransform(newTransform.getWorldTransform())
          print("📥 Received synced picnic placement")
        })
      }
    })
  }
}
