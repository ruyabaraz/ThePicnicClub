import { PinchButton } from "SpectaclesInteractionKit.lspkg/Components/UI/PinchButton/PinchButton";
import Event from "SpectaclesInteractionKit.lspkg/Utils/Event";
import Tween from "LSTween.lspkg/TweenJS/Tween";
import { LSTween } from "LSTween.lspkg/LSTween";
import { AIItemSyncController } from "./AIItemSyncController";

@component
export class ASRQueryController extends BaseScriptComponent {
  @input private button: PinchButton;
  @input private activityRenderMesh: RenderMeshVisual;
  @input private aiItemSyncController: AIItemSyncController;

  private activityMaterial: Material;
  private asrModule = require("LensStudio:AsrModule");
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
      this.getVoiceQuery()
        .then((query) => {
          this.classifyCategory(query, (category) => {
            if (category === "food") {
              this.aiItemSyncController.generateAndSync(query);
              this.onQueryEvent.invoke(query);
            } else {
              print(`❌ "${query}" rejected — category: ${category}`);
            }
          });
        })
        .catch((err) => {
          print("Voice query error: " + err);
        });
    });
  }

  private getVoiceQuery(): Promise<string> {
    return new Promise((resolve, reject) => {
      if (this.isRecording) {
        this.animateVoiceIndicator(false);
        this.asrModule.stopTranscribing();
        this.isRecording = false;
        reject("Already recording");
        return;
      }

      this.isRecording = true;

      const options = this.asrModule.createTranscriptionOptions();
      options.mode = this.asrModule.TranscriptionMode.HighAccuracy;
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
      const percent = on ? data.t : 1 - data.t;
      this.activityMaterial.mainPass.in_out = percent;
    });
    tween.start();
  }

  // ✅ GPT Classifier using structured JSON output
  private classifyCategory(prompt: string, callback: (category: string) => void) {
    if (!global.chatGpt) {
      print("❌ ChatGPT not available. Is the integration added to the Lens?");
      callback("unknown");
      return;
    }

    const request = {
      temperature: 0,
      messages: [
        {
          role: "system",
          content: "You are a classification engine. Only respond in JSON like this: {\"category\": \"food\"}"
        },
        {
          role: "user",
          content: `Classify this phrase: "${prompt}". Possible values: food, animal, object, place, other.`
        }
      ]
    };

    global.chatGpt.completions(request, (error, response) => {
      if (!error && typeof response === "object") {
        try {
          const text = response.choices[0].message.content;
          const json = JSON.parse(text);
          const category = json.category?.toLowerCase() || "unknown";
          callback(category);
        } catch (e) {
          print("❌ JSON parse error: " + e);
          callback("unknown");
        }
      } else {
        print("❌ GPT error: " + JSON.stringify(response));
        callback("unknown");
      }
    });
  }
}
