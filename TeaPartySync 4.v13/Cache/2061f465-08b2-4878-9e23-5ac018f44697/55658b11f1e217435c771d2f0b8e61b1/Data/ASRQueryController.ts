import { PinchButton } from "SpectaclesInteractionKit.lspkg/Components/UI/PinchButton/PinchButton";
import Event from "SpectaclesInteractionKit.lspkg/Utils/Event";
import Tween from "LSTween.lspkg/TweenJS/Tween";
import { LSTween } from "LSTween.lspkg/LSTween";

@component
export class ASRQueryController extends BaseScriptComponent {
  @input
  private button: PinchButton;
  @input
  private activityRenderMesh: RenderMeshVisual;
  private activityMaterial: Material;

  private asrModule: AsrModule = require("LensStudio:AsrModule");
  private isRecording: boolean = false;
  private isInitialized: boolean = false;

  public onQueryEvent: Event<string> = new Event<string>();

  onAwake() {
    this.createEvent("OnStartEvent").bind(this.init.bind(this));
  }

  private init() {
    try {
      this.activityMaterial = this.activityRenderMesh.mainMaterial.clone();
      this.activityRenderMesh.clearMaterials();
      this.activityRenderMesh.mainMaterial = this.activityMaterial;
      this.activityMaterial.mainPass.in_out = 0;
      
      this.button.onButtonPinched.add(() => {
        // Add a small delay to ensure everything is ready
        this.createEvent("DelayedCallbackEvent").bind(() => {
          this.getVoiceQuery().then((query) => {
            this.onQueryEvent.invoke(query);
          }).catch((error) => {
            print("Voice query error: " + error);
          });
        });
      });
      
      this.isInitialized = true;
      print("ASRQueryController initialized successfully");
    } catch (error) {
      print("ASRQueryController initialization error: " + error);
    }
  }

  public getVoiceQuery(): Promise<string> {
    return new Promise((resolve, reject) => {
      if (!this.isInitialized) {
        reject("Component not initialized");
        return;
      }
      
      if (this.isRecording) {
        this.animateVoiceIndicator(false);
        this.asrModule.stopTranscribing();
        this.isRecording = false;
        reject("Already recording, cancel recording");
        return;
      }
      
      try {
        this.isRecording = true;
        let asrSettings = AsrModule.AsrTranscriptionOptions.create();
        asrSettings.mode = AsrModule.AsrMode.HighAccuracy;
        asrSettings.silenceUntilTerminationMs = 1500;
        
        asrSettings.onTranscriptionUpdateEvent.add((asrOutput) => {
          try {
            if (asrOutput.isFinal) {
              this.isRecording = false;
              this.animateVoiceIndicator(false);
              this.asrModule.stopTranscribing();
              print("ASR Final result: " + asrOutput.text);
              resolve(asrOutput.text);
            }
          } catch (error) {
            print("ASR update error: " + error);
            this.isRecording = false;
            this.animateVoiceIndicator(false);
            reject(error);
          }
        });
        
        asrSettings.onTranscriptionErrorEvent.add((asrOutput) => {
          print("ASR transcription error: " + asrOutput);
          this.isRecording = false;
          this.animateVoiceIndicator(false);
          reject(asrOutput);
        });
        
        this.animateVoiceIndicator(true);
        print("Starting ASR transcription...");
        this.asrModule.startTranscribing(asrSettings);
        
      } catch (error) {
        print("ASR setup error: " + error);
        this.isRecording = false;
        this.animateVoiceIndicator(false);
        reject(error);
      }
    });
  }

  private animateVoiceIndicator(on: boolean) {
    try {
      if (on) {
        LSTween.rawTween(250)
          .onUpdate((data) => {
            let percent = data.t as number;
            if (this.activityMaterial && this.activityMaterial.mainPass) {
              this.activityMaterial.mainPass.in_out = percent;
            }
          })
          .start();
      } else {
        LSTween.rawTween(250)
          .onUpdate((data) => {
            let percent = 1 - (data.t as number);
            if (this.activityMaterial && this.activityMaterial.mainPass) {
              this.activityMaterial.mainPass.in_out = percent;
            }
          })
          .start();
      }
    } catch (error) {
      print("Voice indicator animation error: " + error);
    }
  }
}