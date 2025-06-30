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
      print("🔄 SyncEntity ready, applying saved prompts")
      this.applySyncedItems(this.aiItemsProp.currentValue)
    })
  }

  public generateAndSync(prompt: string): void {
    print("🧠 generateAndSync() called with:", prompt)

    if (!prompt || prompt.trim() === "") {
      print("⚠️ Empty AI prompt.")
      return
    }

    const itemId = this.generateId(prompt)

    if (this.localGenerated[itemId]) {
      print(`✅ '${prompt}' already synced.`)
      return
    }

    try {
      this.snap3DFactory.createInteractable3DObject(prompt)
      print(`✨ Generated Snap3D for '${prompt}'`)
    } catch (e) {
      print(`❌ Failed to generate Snap3D: ${e}`)
      return
    }

    this.localGenerated[itemId] = true

    let items = this.getCurrentItems()
    items.push(prompt)

    const newStr = JSON.stringify(items)
    this.aiItemsProp.setPendingValue(newStr)
    print("📤 Synced state:", newStr)
  }

  private applySyncedItems = (dataStr: string) => {
    print("📥 applySyncedItems() triggered with:", dataStr)

    let prompts: string[] = []
    try {
      prompts = JSON.parse(dataStr)
      if (!Array.isArray(prompts)) throw new Error()
    } catch {
      print("⚠️ Failed to parse prompt list.")
      return
    }

    prompts.forEach(prompt => {
      const id = this.generateId(prompt)

      if (!this.localGenerated[id]) {
        this.localGenerated[id] = true
        print(`🌀 Sync-generating: '${prompt}'`)
        try {
          this.snap3DFactory.createInteractable3DObject(prompt)
        } catch (e) {
          print(`❌ Failed to generate synced Snap3D: ${e}`)
        }
      }
    })
  }

  private getCurrentItems(): string[] {
    try {
      return JSON.parse(this.aiItemsProp.currentValue) || []
    } catch {
      return []
    }
  }

  private generateId(prompt: string): string {
    return prompt.toLowerCase().trim()
  }
}
