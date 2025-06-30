@component
export class AIItemSyncController extends BaseScriptComponent {
  // ... your existing code ...

  public generateAndSync(prompt: string, position?: vec3): void {
    print("🧠 generateAndSync() called with:", prompt) // 👈 RIGHT HERE

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

    this.snap3DFactory.createInteractable3DObject(prompt, pos)
    this.localGenerated[itemId] = true

    let items = this.getCurrentItems()
    items.push({ prompt, pos: [pos.x, pos.y, pos.z] })

    const newStr = JSON.stringify(items)
    this.aiItemsProp.setPendingValue(newStr)
    print("📤 Syncing state:", newStr) // Optional but helpful
  }

  // ... rest of your script ...
}
