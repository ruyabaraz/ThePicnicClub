"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.GPTFilter = void 0;
var __selfType = requireType("./GPTFilter");
function component(target) { target.getTypeName = function () { return __selfType; }; }
let GPTFilter = class GPTFilter extends BaseScriptComponent {
    /**
     * Takes a prompt string and determines if it falls within the allowed categories (food or animal).
     * Returns true if allowed, false otherwise.
     */
    filterPrompt(prompt) {
        return new Promise((resolve, reject) => {
            const request = {
                temperature: 0,
                response_format: "json",
                messages: [
                    {
                        role: "system",
                        content: "You are a helpful assistant that checks whether a user prompt refers to a food item or an animal. " +
                            "Respond only with this exact JSON format: {\"category\": string, \"isAllowed\": boolean}. " +
                            "Set isAllowed to true only if it's food or animal."
                    },
                    {
                        role: "user",
                        content: `Does this refer to a food or animal? "${prompt}"`
                    }
                ]
            };
            print(`🔎 Sending to GPT for category filtering: ${prompt}`);
            global.chatGpt.completions(request, (errorStatus, response) => {
                if (errorStatus || !response) {
                    print("❌ GPT filtering failed due to network or API error.");
                    resolve(false);
                    return;
                }
                try {
                    const content = response.choices[0].message.content;
                    print(`✅ GPT raw response: ${content}`);
                    const json = JSON.parse(content);
                    const isAllowed = json.isAllowed === true;
                    print(`✅ GPT decision: isAllowed = ${isAllowed}, category = ${json.category}`);
                    resolve(isAllowed);
                }
                catch (e) {
                    print("❌ Failed to parse GPT response as JSON");
                    resolve(false);
                }
            });
        });
    }
};
exports.GPTFilter = GPTFilter;
exports.GPTFilter = GPTFilter = __decorate([
    component
], GPTFilter);
//# sourceMappingURL=GPTFilter.js.map