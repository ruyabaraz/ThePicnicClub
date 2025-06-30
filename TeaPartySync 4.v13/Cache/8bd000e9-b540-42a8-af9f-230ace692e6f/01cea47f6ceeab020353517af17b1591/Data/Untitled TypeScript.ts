@input vmlModule: Asset.VoiceMLModule

function startVoiceRecognition() {
  if (!script.vmlModule) {
    print("❌ VoiceMLModule not assigned.");
    return;
  }

  script.vmlModule.onResult.add(function (text: string) {
    print("👂 Heard: " + text);

    if (text.toLowerCase().includes("cake")) {
      print("🍰 User wants cake!");
      // Add your custom trigger or action here
    }
  });

  script.vmlModule.startListening({ timeout: 5 });
}
