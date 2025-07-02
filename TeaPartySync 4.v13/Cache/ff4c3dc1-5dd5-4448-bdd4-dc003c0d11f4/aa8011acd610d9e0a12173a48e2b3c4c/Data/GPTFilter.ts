// GPTFilter.ts

// Declare the global.chatGpt API so TypeScript doesn't complain
declare const global: {
  chatGpt: {
    completions: (
      request: any,
      callback: (errorStatus: any, response: any) => void
    ) => void;
  };
};

@component
export class GPTFilter extends BaseScriptComponent {
  /**
   * Takes a prompt string and determines if it falls within the allowed categories (food or animal).
   * Returns true if allowed, false otherwise.
   */
  public filterPrompt(prompt: string): Promise<boolean> {
    return new Promise((resolve, reject) => {
      const request = {
        temperature: 0,
        response_format: "json",
        messages: [
          {
            role: "system",
            content:
              "You are a helpful assistant that checks whether a user prompt refers to a food item or an animal. " +
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
        } catch (e) {
          print("❌ Failed to parse GPT response as JSON");
          resolve(false);
        }
      });
    });
  }
}
