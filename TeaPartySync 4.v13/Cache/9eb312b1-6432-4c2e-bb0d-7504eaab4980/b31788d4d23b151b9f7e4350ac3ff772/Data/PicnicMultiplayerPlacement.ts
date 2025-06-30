import { SurfaceDetection } from './SurfaceDetection'
import { SyncEntity } from 'SpectaclesSyncKit.lspkg/Core/SyncEntity'
import { StorageProperty } from 'SpectaclesSyncKit.lspkg/Core/StorageProperty'
import { SessionController } from 'SpectaclesSyncKit.lspkg/Core/SessionController'

@component
export class PicnicMultiplayerPlacement extends BaseScriptComponent {

  @input picnicRoot!: SceneObject
  @input surfaceDetection!: SurfaceDetection

  private syncEntity: SyncEntity
  private picnicPositionProp = StorageProperty.manualVec3("picnicPos", vec3.zero())
  private picnicRotationProp = StorageProperty.manualQuat("picnicRot", quat.quatIdentity())

  onAwake(): void {
    this.syncEntity = new SyncEntity(this)
    this.syncEntity.addStorageProperty(this.picnicPositionProp)
    this.syncEntity.addStorageProperty(this.picnicRotationProp)

    this.syncEntity.notifyOnReady(() => {
      const isHost = SessionController.getInstance().isHost()

      if (isHost) {
        print("👑 Host: Starting surface detection")
        this.surfaceDetection.startGroundCalibration((pos, rot) => {
          print("📦 Host found surface. Broadcasting placement.")
          this.picnicPositionProp.setPendingValue(pos)
          this.picnicRotationProp.setPendingValue(rot)
          this.placePicnic(pos, rot)
        })

      } else {
        print("👥 Guest: Waiting for host placement")

        // Hide the surface detection visuals for non-hosts
        this.surfaceDetection.getSceneObject().enabled = false

        // Wait for synced placement
        this.picnicPositionProp.onAnyChange.add((newPos) => {
          const newRot = this.picnicRotationProp.currentValue
          print("📥 Guest received placement. Applying.")
          this.placePicnic(newPos, newRot)
        })
      }
    })
  }

  private placePicnic(pos: vec3, rot: quat) {
    const t = this.picnicRoot.getTransform()
    t.setWorldPosition(pos)
    t.setWorldRotation(rot)
  }
}
