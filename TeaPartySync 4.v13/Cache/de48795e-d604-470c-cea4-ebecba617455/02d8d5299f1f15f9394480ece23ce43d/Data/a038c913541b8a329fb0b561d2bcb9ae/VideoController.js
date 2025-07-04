"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.VideoController = void 0;
const Event_1 = require("../Utils/Event");
/**
 * Class for managing video/image input from the camera to send to an external service.
 */
class VideoController {
    /**
     *
     * @param sendRateMS - The rate at which video frames are sent in milliseconds. Default is 2000ms.
     * @param compressionQuality - The quality of the image compression. Default is CompressionQuality.IntermediateQuality.
     * @param encodingType - The type of encoding for the video frames. Default is EncodingType.Jpg.
     */
    constructor(sendRateMS = 2000, compressionQuality = CompressionQuality.IntermediateQuality, encodingType = EncodingType.Jpg) {
        this.cameraModule = require("LensStudio:CameraModule");
        this.sendRateMS = 2000;
        this.onEncodedFrame = new Event_1.default();
        this.isRecording = false;
        this.lastRecordedTime = 0;
        this.sendRateMS = sendRateMS;
        this.compressionQuality = compressionQuality;
        this.encodingType = encodingType;
    }
    /**
     * Starts the video recording and removes the event listener.
     */
    startRecording() {
        if (this.isRecording) {
            print("Already recording");
            return;
        }
        let cameraRequest = CameraModule.createCameraRequest();
        cameraRequest.cameraId = CameraModule.CameraId.Default_Color;
        this.cameraTexture = this.cameraModule.requestCamera(cameraRequest);
        this.cameraTextureProvider = this.cameraTexture.control;
        this.eventRegistration = this.cameraTextureProvider.onNewFrame.add((frame) => {
            if (this.lastRecordedTime + this.sendRateMS > getTime() * 1000) {
                return;
            }
            this.lastRecordedTime = getTime() * 1000;
            Base64.encodeTextureAsync(this.cameraTexture, (base64String) => {
                if (base64String.length === 0) {
                    return;
                }
                let prefix = "data:image/png;base64,";
                if (this.encodingType == EncodingType.Jpg) {
                    prefix = "data:image/jpg;base64,";
                }
                let img = prefix + base64String;
                this.onEncodedFrame.invoke(base64String);
            }, () => {
                print("Error encoding texture");
            }, this.compressionQuality, this.encodingType);
        });
        this.isRecording = true;
    }
    /**
     * Stops the video recording and removes the event listener.
     */
    stopRecording() {
        if (!this.isRecording) {
            print("Not recording");
            return;
        }
        this.cameraTextureProvider.onNewFrame.remove(this.eventRegistration);
        this.isRecording = false;
    }
}
exports.VideoController = VideoController;
//# sourceMappingURL=VideoController.js.map