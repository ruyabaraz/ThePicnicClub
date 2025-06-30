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

    this.aiItemsProp.onAnyChange.add((val) => this.applySyncedItems(val))

    this.syncEntity.notifyOnReady(() => {
      print("🔄 Sync ready. Applying saved prompts...")
      this.applySyncedItems(this.aiItemsProp.currentValue)
    })
  }

  public generateAndSync(prompt: string): void {
    print("🧠 Called generateAndSync with:", prompt)

    if (!prompt || prompt.trim() === "") {
      print("⚠️ Empty prompt")
      return
    }

    const id = prompt.toLowerCase().trim()

    if (this.localGenerated[id]) {
      print(`✅ '${prompt}' already generated.`)
      return
    }

    this.localGenerated[id] = true

    // ✅ ONE ARG ONLY
    this.snap3DFactory.createInteractable3DObject(prompt)
    print(`✨ Created Snap3D: '${prompt}'`)

    const prompts = this.getCurrentPromptList()
    prompts.push(prompt)

    const jsonStr = JSON.stringify(prompts)
    this.aiItemsProp.setPendingValue(jsonStr)
    print("📤 Sent synced prompt list:", jsonStr)
  }

  private applySyncedItems(dataStr: string): void {
    print("📥 applySyncedItems() received:", dataStr)

    let prompts: string[] = []
    try {
      prompts = JSON.parse(dataStr)
    } catch {
      print("⚠️ Failed to parse synced list")
      return
    }

    if (!Array.isArray(prompts)) {
      print("⚠️ Synced list is not an array")
      return
    }

    prompts.forEach((prompt) => {
      const id = prompt.toLowerCase().trim()
      if (!this.localGenerated[id]) {
        this.localGenerated[id] = true
        print(`🌀 Generating synced Snap3D: '${prompt}'`)
        this.snap3DFactory.createInteractable3DObject(prompt) // ✅ ONE ARG ONLY
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
