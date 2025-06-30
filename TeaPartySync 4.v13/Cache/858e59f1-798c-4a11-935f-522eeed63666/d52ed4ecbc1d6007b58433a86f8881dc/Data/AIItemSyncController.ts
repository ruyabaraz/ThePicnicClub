import { SyncEntity } from "SpectaclesSyncKit.lspkg/Core/SyncEntity"
import { StorageProperty } from "SpectaclesSyncKit.lspkg/Core/StorageProperty"
import { Snap3DInteractableFactory } from "./3DGeneration/Snap3DInteractableFactory"

@component
export class AIItemSyncController extends BaseScriptComponent {
  @input snap3DFactory: Snap3DInteractableFactory

  private aiItemsProp = StorageProperty.manualString("syncedPrompts", "[]")
  private syncEntity: SyncEntity
  private localGenerated: Record<string, boolean> = {}

  onAwake(): void {
    this.syncEntity = new SyncEntity(this)
    this.syncEntity.addStorageProperty(this.aiItemsProp)

    this.aiItemsProp.onAnyChange.add(this.applySyncedItems)

    this.syncEntity.notifyOnReady(() => {
      print("🔄 SyncEntity ready — applying stored prompts...")
      this.applySyncedItems(this.aiItemsProp.currentValue)
    })
  }

  public generateAndSync(prompt: string): void {
    print("🧠 generateAndSync() called with:", prompt)

    if (!prompt || prompt.trim() === "") {
      print("⚠️ Empty AI prompt")
      return
    }

    const id = prompt.toLowerCase().trim()

    if (this.localGenerated[id]) {
      print(`✅ '${prompt}' already generated`)
      return
    }

    this.localGenerated[id] = true

    // 🔥 ONLY ONE ARGUMENT
    this.snap3DFactory.createInteractable3DObject(prompt)

    print(`✨ Locally generated Snap3D: '${prompt}'`)

    // Add prompt to synced list
    const prompts = this.getCurrentPromptList()
    prompts.push(prompt)

    const jsonStr = JSON.stringify(prompts)
    this.aiItemsProp.setPendingValue(jsonStr)

    print("📤 Synced prompt list:", jsonStr)
  }

  private applySyncedItems = (dataStr: string) => {
    print("📥 applySyncedItems() received:", dataStr)

    let prompts: string[] = []
    try {
      prompts = JSON.parse(dataStr)
      if (!Array.isArray(prompts)) throw new Error()
    } catch {
      print("⚠️ Failed to parse synced prompt list.")
      return
    }

    prompts.forEach(prompt => {
      const id = prompt.toLowerCase().trim()
      if (!this.localGenerated[id]) {
        this.localGenerated[id] = true
        print(`🌀 Generating Snap3D from synced prompt: '${prompt}'`)
        this.snap3DFactory.createInteractable3DObject(prompt) // ✅ only 1 arg
      }
    })
  }

  private getCurrentPromptList(): string[] {
    try {
      return JSON.parse(this.aiItemsProp.currentValue) || []
    } catch {
      return []
    }
  }
}
