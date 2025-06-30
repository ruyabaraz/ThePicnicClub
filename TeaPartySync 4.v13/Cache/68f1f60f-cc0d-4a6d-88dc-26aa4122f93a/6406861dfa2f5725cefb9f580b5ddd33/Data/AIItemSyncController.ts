import { SyncEntity } from "SpectaclesSyncKit.lspkg/Core/SyncEntity"
import { StorageProperty } from "SpectaclesSyncKit.lspkg/Core/StorageProperty"
import { Snap3DInteractableFactory } from "./3DGeneration/Snap3DInteractableFactory"

@component
export class AIItemSyncController extends BaseScriptComponent {
  @input snap3DFactory: Snap3DInteractableFactory

  private promptProp = StorageProperty.manualString("syncedPrompts", "[]")
  private syncEntity: SyncEntity
  private localGenerated: Record<string, boolean> = {}

  onAwake(): void {
    this.syncEntity = new SyncEntity(this)
    this.syncEntity.addStorageProperty(this.promptProp)

    this.promptProp.onAnyChange.add((value) => {
      print("📥 Prompt list received:", value)
      this.generateFromSyncedList(value)
    })

    this.syncEntity.notifyOnReady(() => {
      print("🔄 Sync ready. Loading saved prompts.")
      this.generateFromSyncedList(this.promptProp.currentValue)
    })
  }

  public generateAndSync(prompt: string): void {
    if (!prompt || prompt.trim() === "") {
      print("⚠️ Empty prompt.")
      return
    }

    const id = prompt.toLowerCase().trim()
    if (this.localGenerated[id]) {
      print(`✅ '${prompt}' already generated.`)
      return
    }

    this.localGenerated[id] = true
    this.snap3DFactory.createInteractable3DObject(prompt)
    print(`✨ Snap3D generated for '${prompt}'`)

    const prompts = this.getPromptList()
    prompts.push(prompt)

    const json = JSON.stringify(prompts)
    this.promptProp.setPendingValue(json)
    print("📤 Prompt list synced:", json)
  }

  private generateFromSyncedList(dataStr: string): void {
    let prompts: string[] = []
    try {
      prompts = JSON.parse(dataStr)
    } catch {
      print("⚠️ Invalid prompt list.")
      return
    }

    prompts.forEach((prompt) => {
      const id = prompt.toLowerCase().trim()
      if (!this.localGenerated[id]) {
        this.localGenerated[id] = true
        this.snap3DFactory.createInteractable3DObject(prompt)
        print(`🌀 Re-generated synced prompt: '${prompt}'`)
      }
    })
  }

  private getPromptList(): string[] {
    try {
      return JSON.parse(this.promptProp.currentValue) || []
    } catch {
      return []
    }
  }
}
