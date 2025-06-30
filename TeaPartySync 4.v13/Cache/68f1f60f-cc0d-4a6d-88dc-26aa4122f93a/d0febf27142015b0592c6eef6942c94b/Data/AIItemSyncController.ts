// AIItemSyncController.ts

import { SyncEntity } from "SpectaclesSyncKit.lspkg/Core/SyncEntity";
import { StorageProperty } from "SpectaclesSyncKit.lspkg/Core/StorageProperty";
import { Snap3DInteractableFactory } from "./Snap3DInteractableFactory";

@component
export class AIItemSyncController extends BaseScriptComponent {
  @input snap3DFactory: Snap3DInteractableFactory;

  private promptProp = StorageProperty.manualString("syncedPrompts", "[]");
  private syncEntity: SyncEntity;
  private localGenerated: Record<string, boolean> = {};

  onAwake(): void {
    this.syncEntity = new SyncEntity(this);
    this.syncEntity.addStorageProperty(this.promptProp);

    this.promptProp.onAnyChange.add((val) => {
      this.applySyncedPrompts(val);
    });

    this.syncEntity.notifyOnReady(() => {
      this.applySyncedPrompts(this.promptProp.currentValue);
    });
  }

  public generateAndSync(prompt: string): void {
    if (!prompt || prompt.trim() === "") return;

    const id = prompt.toLowerCase().trim();
    if (this.localGenerated[id]) return;

    this.localGenerated[id] = true;
    this.snap3DFactory.createInteractable3DObject(prompt);

    const prompts = this.getPromptList();
    prompts.push(prompt);
    this.promptProp.setPendingValue(JSON.stringify(prompts));
  }

  private applySyncedPrompts(dataStr: string): void {
    if (!dataStr) return;

    let prompts: string[] = [];
    try {
      const parsed = JSON.parse(dataStr);
      if (Array.isArray(parsed)) {
        prompts = parsed;
      }
    } catch {
      return;
    }

    prompts.forEach((prompt) => {
      const id = prompt.toLowerCase().trim();
      if (!this.localGenerated[id]) {
        this.localGenerated[id] = true;
        this.snap3DFactory.createInteractable3DObject(prompt);
      }
    });
  }

  private getPromptList(): string[] {
    try {
      const parsed = JSON.parse(this.promptProp.currentValue);
      return Array.isArray(parsed) ? parsed : [];
    } catch {
      return [];
    }
  }
}
