import { SyncEntity } from "SpectaclesSyncKit.lspkg/Core/SyncEntity"
import { StorageProperty } from "SpectaclesSyncKit.lspkg/Core/StorageProperty"
import { Snap3DInteractableFactory } from "./3DGeneration/Snap3DInteractableFactory"

@component
export class AIItemSyncController extends BaseScriptComponent {
  @input snap3DFactory: Snap3DInteractableFactory

  private aiPromptsProp = StorageProperty.manualString("syncedPrompts", "[]")
  private syncEntity: SyncEntity
  private localGenerated: Record<string, boolean> = {}

  onAwake(): void {
    this.syncEntity = new SyncEntity(this)
    this.syncEntity.addStorageProperty(this.aiPromptsProp)

    this.aiPromptsProp.onAnyChange.add(this.applySyncedPrompts)
    this.syncEntity.notifyOnReady(() => {
      print("🔄 Sync ready, applying stored prompts...")
      this.applySyncedPrompts(this.aiPromptsProp.currentValue)
    })
  }

  public generateAndSync(prompt: string): void {
    print("🧠 generateAndSync() called with:", prompt)

    if (!prompt || prompt.trim() === "") {
      print("⚠️ Empty prompt")
      return
    }

    const id = prompt.toLowerCase().trim()
    if (this.localGenerated[id]) {
      print(`✅ '${prompt}' already generated locally.`)
      return
    }

    this.localGenerated[id] = true

    // Generate locally
    this.snap3DFactory.createInteractable3DObject(prompt)
    print(`✨ Generated Snap3D: '${prompt}'`)

    // Add to shared list
    const prompts = this.getCurrentPromptList()
    prompts.push(prompt)
    const updated = JSON.stringify(prompts)
    this.aiPromptsProp.setPendingValue(updated)

    print("📤 Synced prompts:", updated)
  }

  private applySyncedPrompts = (dataStr: string) => {
    print("📥 applySyncedPrompts() received:", dataStr)

    let prompts: string[] = []
    try {
      prompts = JSON.parse(dataStr)
      if (!Array.isArray(prompts)) throw new Error()
    } catch {
      print("⚠️ Failed to parse prompts list")
      return
    }

    prompts.forEach(prompt => {
      const id = prompt.toLowerCase().trim()
      if (!this.localGenerated[id]) {
        this.localGenerated[id] = true
        print(`🌀 Generating synced Snap3D for: '${prompt}'`)
        this.snap3DFactory.createInteractable3DObject(prompt)
      }
    })
  }

  private getCurrentPromptList(): string[] {
    try {
      return JSON.parse(this.aiPromptsProp.currentValue) || []
    } catch {
      return []
    }
  }
}
