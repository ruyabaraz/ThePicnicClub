@component
export class GPTFilter extends BaseScriptComponent {
  public filterPrompt(prompt: string): Promise<boolean> {
    return new Promise((resolve, reject) => {
      const request = {
        temperature: 0,
        messages: [
          {
            role: "system",
            content:
              "You are a helpful assistant that checks whether a prompt refers to a food item or animal. Respond only with this exact JSON format: {\"category\": string, \"isAllowed\": boolean}"
          },
          {
            role: "user",
            content: `Does this refer to a food or animal? "${prompt}"`
          }
        ],
        response_format: "json"
      };

      global.chatGpt.completions(request, (errorStatus, response) => {
        if (errorStatus || !response) {
          print("GPT filtering failed");
          resolve(false);
        } else {
          try {
            const content = response.choices[0].message.content;
            const json = JSON.parse(content);
            resolve(json.isAllowed === true);
          } catch (e) {
            print("Failed to parse GPT response");
            resolve(false);
          }
        }
      });
    });
  }
}
