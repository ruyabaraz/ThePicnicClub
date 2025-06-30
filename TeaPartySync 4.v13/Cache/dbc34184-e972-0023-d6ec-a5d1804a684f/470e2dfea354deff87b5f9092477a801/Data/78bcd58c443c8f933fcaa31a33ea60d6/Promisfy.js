"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Promisfy = exports.promisifyWithReject = exports.promisify = void 0;
function promisify(target, fn, ...args) {
    return new Promise((resolve) => {
        fn.call(target, ...args, resolve);
    });
}
exports.promisify = promisify;
function promisifyWithReject(target, fn, ...args) {
    return new Promise((resolve, reject) => {
        fn.call(target, ...args, resolve, reject);
    });
}
exports.promisifyWithReject = promisifyWithReject;
var Promisfy;
(function (Promisfy) {
    var RemoteServiceModule;
    (function (RemoteServiceModule) {
        function performApiRequest(self, request) {
            return promisify(self, self.performApiRequest, request);
        }
        RemoteServiceModule.performApiRequest = performApiRequest;
    })(RemoteServiceModule = Promisfy.RemoteServiceModule || (Promisfy.RemoteServiceModule = {}));
})(Promisfy || (exports.Promisfy = Promisfy = {}));
// setTimeout(callback: () => void, time: number) {
//   let delayedEvent = this.createEvent("DelayedCallbackEvent");
//   delayedEvent.reset(time / 1000);
//   delayedEvent.bind((eventData: any) => {
//     callback();
//   });
// }
// promiseSetTimeout(time: number): Promise<void> {
//   return new Promise((resolve) => {
//     this.setTimeout(() => {
//       resolve();
//     }, time);
//   });
// }
(function (Promisfy) {
    var RemoteMediaModule;
    (function (RemoteMediaModule) {
        function loadResourceAsImageTexture(self, resource) {
            return promisifyWithReject(self, self.loadResourceAsImageTexture, resource);
        }
        RemoteMediaModule.loadResourceAsImageTexture = loadResourceAsImageTexture;
        function loadResourceAsVideoTexture(self, resource) {
            return promisifyWithReject(self, self.loadResourceAsVideoTexture, resource);
        }
        RemoteMediaModule.loadResourceAsVideoTexture = loadResourceAsVideoTexture;
        function loadResourceAsGltfAsset(self, resource) {
            return promisifyWithReject(self, self.loadResourceAsGltfAsset, resource);
        }
        RemoteMediaModule.loadResourceAsGltfAsset = loadResourceAsGltfAsset;
        function loadResourceAsAudioTrackAsset(self, resource) {
            return promisifyWithReject(self, self.loadResourceAsAudioTrackAsset, resource);
        }
        RemoteMediaModule.loadResourceAsAudioTrackAsset = loadResourceAsAudioTrackAsset;
    })(RemoteMediaModule = Promisfy.RemoteMediaModule || (Promisfy.RemoteMediaModule = {}));
})(Promisfy || (exports.Promisfy = Promisfy = {}));
//# sourceMappingURL=Promisfy.js.map