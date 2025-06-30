import { SyncEntity } from "SpectaclesSyncKit.lspkg/Core/SyncEntity"
import { StorageProperty } from "SpectaclesSyncKit.lspkg/Core/StorageProperty"
import { Snap3DInteractableFactory } from "../3D Generation/Snap3DInteractableFactory"


@component
export class AIItemSyncController extends BaseScriptComponent {
  @input snap3DFactory: Snap3DInteractableFactory
  @input targetSceneObject: SceneObject // A fallback for spawn position

  // This will store a serialized list of { prompt, pos } items
  private aiItemsProp = StorageProperty.manualString("aiGeneratedItems", "[]")
  private syncEntity: SyncEntity

  private localGenerated: Record<string, boolean> = {}

  onAwake(): void {
    this.syncEntity = new SyncEntity(this)
    this.syncEntity.addStorageProperty(this.aiItemsProp)

    this.aiItemsProp.onAnyChange.add(this.applySyncedItems)
    this.syncEntity.notifyOnReady(() => {
      this.applySyncedItems(this.aiItemsProp.currentValue)
    })
  }

  /** Call this function when a new AI prompt is used locally */
  public generateAndSync(prompt: string, position?: vec3): void {
    if (!prompt || prompt.trim() === "") {
      print("⚠️ Empty AI prompt.")
      return
    }

    const pos = position || this.targetSceneObject.getTransform().getWorldPosition()
    const itemId = this.generateId(prompt, pos)

    if (this.localGenerated[itemId]) {
      print(`✅ '${prompt}' already synced.`)
      return
    }

    // Locally generate item first
    this.snap3DFactory.createInteractable3DObject(prompt, pos)
    this.localGenerated[itemId] = true

    // Add to shared list
    let items = this.getCurrentItems()
    items.push({ prompt, pos: [pos.x, pos.y, pos.z] })

    const newStr = JSON.stringify(items)
    this.aiItemsProp.setPendingValue(newStr)
  }

  private applySyncedItems = (dataStr: string) => {
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
      if (!prompt || !posArr || posArr.length !== 3) return

      const pos = new vec3(posArr[0], posArr[1], posArr[2])
      const id = this.generateId(prompt, pos)

      if (!this.localGenerated[id]) {
        this.localGenerated[id] = true
        this.snap3DFactory.createInteractable3DObject(prompt, pos)
        print(`🌀 Synced AI item: '${prompt}'`)
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
