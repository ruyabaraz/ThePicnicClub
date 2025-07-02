// ASRQueryController.ts

import { PinchButton } from "SpectaclesInteractionKit.lspkg/Components/UI/PinchButton/PinchButton";
import Event from "SpectaclesInteractionKit.lspkg/Utils/Event";
import Tween from "LSTween.lspkg/TweenJS/Tween";
import { LSTween } from "LSTween.lspkg/LSTween";
import { AIItemSyncController } from "./AIItemSyncController";
import { GPTFilter } from "./GPTFilter"; // Make sure the path is correct

@component
export class ASRQueryController extends BaseScriptComponent {
  @input private button: PinchButton;
  @input private activityRenderMesh: RenderMeshVisual;
  @input private aiItemSyncController: AIItemSyncController;
  @input private gptFilter: GPTFilter; // ✅ New input for GPT filtering

  private activityMaterial: Material;
  private asrModule: AsrModule = require("LensStudio:AsrModule");
  private isRecording: boolean = false;

  public onQueryEvent: Event<string> = new Event<string>();

  onAwake() {
    this.createEvent("OnStartEvent").bind(this.init.bind(this));
  }

  private init() {
    this.activityMaterial = this.activityRenderMesh.mainMaterial.clone();
    this.activityRenderMesh.clearMaterials();
    this.activityRenderMesh.mainMaterial = this.activityMaterial;
    this.activityMaterial.mainPass.in_out = 0;

    this.button.onButtonPinched.add(() => {
      this.getVoiceQuery().then((query) => {
        print(`🎤 Transcribed query: ${query}`);

        // ✅ Use GPT to check if the query is allowed
        this.gptFilter.filterPrompt(query).then((isAllowed) => {
          if (isAllowed) {
            print(`✅ Allowed prompt: generating "${query}"`);
            this.aiItemSyncController.generateAndSync(query);
            this.onQueryEvent.invoke(query);
          } else {
            print(`❌ Rejected prompt: "${query}" is not a food item.`);
            // Optional: Show rejection UI feedback here
          }
        });
      });
    });
  }

  public getVoiceQuery(): Promise<string> {
    return new Promise((resolve, reject) => {
      if (this.isRecording) {
        this.animateVoiceIndicator(false);
        this.asrModule.stopTranscribing();
        this.isRecording = false;
        reject("Already recording");
        return;
      }

      this.isRecording = true;

      let options = AsrModule.AsrTranscriptionOptions.create();
      options.mode = AsrModule.AsrMode.HighAccuracy;
      options.silenceUntilTerminationMs = 1500;

      options.onTranscriptionUpdateEvent.add((res) => {
        if (res.isFinal) {
          this.isRecording = false;
          this.animateVoiceIndicator(false);
          this.asrModule.stopTranscribing();
          resolve(res.text);
        }
      });

      options.onTranscriptionErrorEvent.add((err) => {
        this.isRecording = false;
        this.animateVoiceIndicator(false);
        reject(err);
      });

      this.animateVoiceIndicator(true);
      this.asrModule.startTranscribing(options);
    });
  }

  private animateVoiceIndicator(on: boolean) {
    const tween = LSTween.rawTween(250).onUpdate((data) => {
      let percent = on ? data.t : 1 - data.t;
      this.activityMaterial.mainPass.in_out = percent;
    });
    tween.start();
  }
}
