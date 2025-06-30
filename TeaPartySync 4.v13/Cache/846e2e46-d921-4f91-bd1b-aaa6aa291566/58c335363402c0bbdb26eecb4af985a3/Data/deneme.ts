// RegisterChatGpt.ts
// ✅ Makes chatGpt globally accessible across scripts

//@input Asset.RemoteServiceModule chatGptService

// Register the RemoteServiceModule (e.g., "ChatGpt") to global
global.chatGpt = script.chatGptService;
