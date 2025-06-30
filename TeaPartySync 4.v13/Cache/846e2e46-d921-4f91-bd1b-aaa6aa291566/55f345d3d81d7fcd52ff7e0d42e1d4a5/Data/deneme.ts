// RegisterChatGpt.ts
// Required to expose the GPT module to the global scope
// Make sure this script is in the Scene and runs before other scripts

const chatGpt = require("ChatGpt"); // This must match the name in your Resources panel!

global.chatGpt = chatGpt;
