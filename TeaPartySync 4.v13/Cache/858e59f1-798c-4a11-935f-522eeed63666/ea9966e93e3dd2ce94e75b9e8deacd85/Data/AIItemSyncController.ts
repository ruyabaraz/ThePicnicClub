import { SyncEntity } from "SpectaclesSyncKit.lspkg/Core/SyncEntity"
import { StorageProperty } from "SpectaclesSyncKit.lspkg/Core/StorageProperty"
import { Snap3DInteractableFactory } from "./3DGeneration/Snap3DInteractableFactory"

@component
export class AIItemSyncController extends BaseScriptComponent {
  @input snap3DFactory: Snap3DInteractableFactory
  @input targetSceneObject: SceneObject

  private aiItemsProp = StorageProperty.manualString("aiGeneratedItems", "[]")
  private syncEntity: SyncEntity

  private localGenerated: Record<string, boolean> = {}

  onAwake(): void {
    this.syncEntity = new SyncEntity(this)
    this.syncEntity.addStorageProperty(this.aiItemsProp)

    this.aiItemsProp.onAnyChange.add(this.applySyncedItems)

    this.syncEntity.notifyOnReady(() => {
      print("🔄 Sync entity ready, applying existing state.")
      this.applySyncedItems(this.aiItemsProp.currentValue)
    })
  }

  /** Call this when a new AI prompt is used locally */
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

    print(`✨ Generating local Snap3D for '${prompt}' at:`, pos.toString())

    try {
      this.snap3DFactory.createInteractable3DObject(prompt, pos)
    } catch (e) {
      print(`❌ Failed to generate local Snap3D: ${e}`)
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
      print("⚠️ Failed to parse AI items list.")
      return
    }

    parsed.forEach(entry => {
      const prompt = entry.prompt
      const posArr = entry.pos
      if (!prompt || !posArr || posArr.length !== 3) {
        print("⚠️ Invalid entry in synced list:", entry)
        return
      }

      const pos = new vec3(posArr[0], posArr[1], posArr[2])
      const id = this.generateId(prompt, pos)

      if (!this.localGenerated[id]) {
        this.localGenerated[id] = true
        print(`🌀 Generating synced Snap3D: '${prompt}' at ${pos.toString()}`)
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
