import { SyncEntity } from "SpectaclesSyncKit.lspkg/Core/SyncEntity"
import { StorageProperty } from "SpectaclesSyncKit.lspkg/Core/StorageProperty"
import { Snap3DInteractableFactory } from "./3DGeneration/Snap3DInteractableFactory"

@component
export class AIItemSyncController extends BaseScriptComponent {
  @input snap3DFactory: Snap3DInteractableFactory
  @input targetSceneObject: SceneObject // Fallback spawn position

  private aiItemsProp = StorageProperty.manualString("aiGeneratedItems", "[]")
  private syncEntity: SyncEntity
  private localGenerated: Record<string, boolean> = {}

  onAwake(): void {
    this.syncEntity = new SyncEntity(this)                  // ✅ Create sync entity
    this.syncEntity.setSyncEnabled(true)                    // ✅ Force-enable syncing
    this.syncEntity.addStorageProperty(this.aiItemsProp)

    this.aiItemsProp.onAnyChange.add(this.applySyncedItems)

    this.syncEntity.notifyOnReady(() => {
      print("🔄 SyncEntity ready. Applying stored items.")
      this.applySyncedItems(this.aiItemsProp.currentValue)
    })
  }

  public generateAndSync(prompt: string, position?: vec3): void {
    print("🧠 generateAndSync() called with:", prompt)

    if (!prompt || prompt.trim() === "") {
      print("⚠️ Empty AI prompt.")
      return
    }

    const pos = position || this.targetSceneObject.getTransform().getWorldPosition()
    const itemId = this.generateId(prompt, pos)

    if (this.localGenerated[itemId]) {
      print(`✅ '${prompt}' already synced. Skipping.`)
      return
    }

    try {
      this.snap3DFactory.createInteractable3DObject(prompt, pos)
      print(`✨ Locally generated Snap3D for '${prompt}'`)
    } catch (e) {
      print(`❌ Snap3D generation failed: ${e}`)
      return
    }

    this.localGenerated[itemId] = true

    let items = this.getCurrentItems()
    items.push({ prompt, pos: [pos.x, pos.y, pos.z] })

    const newStr = JSON.stringify(items)
    this.aiItemsProp.setPendingValue(newStr)
    print("📤 Syncing state:", newStr)
  }

  private applySyncedItems = (dataStr: string) => {
    print("📥 applySyncedItems() triggered with:", dataStr)

    let parsed: any[] = []
    try {
      parsed = JSON.parse(dataStr)
      if (!Array.isArray(parsed)) throw new Error()
    } catch {
      print("⚠️ Failed to parse AI item list.")
      return
    }

    parsed.forEach(entry => {
      const prompt = entry.prompt
      const posArr = entry.pos
      if (!prompt || !posArr || posArr.length !== 3) return

      const pos = new vec3(posArr[0], posArr[1], posArr[2])
      const id = this.generateId(prompt, pos)

      if (!this.localGenerated[id]) {
        this.localGenerated[id] = true
        print(`🌀 Generating Snap3D for synced prompt: '${prompt}'`)
        try {
          this.snap3DFactory.createInteractable3DObject(prompt, pos)
        } catch (e) {
          print(`❌ Failed to generate synced Snap3D: ${e}`)
        }
      }
    })
  }

  private getCurrentItems(): { prompt: string; pos: number[] }[] {
    try {
      return JSON.parse(this.aiItemsProp.currentValue) || []
    } catch {
      return []
    }
  }

  private generateId(prompt: string, pos: vec3): string {
    return `${prompt}-${pos.x.toFixed(2)}-${pos.y.toFixed(2)}-${pos.z.toFixed(2)}`
  }
}
