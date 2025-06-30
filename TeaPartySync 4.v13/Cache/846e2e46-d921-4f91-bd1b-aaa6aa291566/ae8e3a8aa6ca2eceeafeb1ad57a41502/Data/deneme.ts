// RegisterChatGpt.ts
// ✅ This script makes the ChatGPT API available globally in your Lens

// Extend the global type so TypeScript recognizes `global.chatGpt`
declare global {
  var chatGpt: any;
}

// Load the ChatGPT module from your project's Resources
const chatGpt = require("ChatGpt"); // 🟡 Make sure this matches the name of your imported module

// Register it globally
global.chatGpt = chatGpt;
