"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.JoiningState = void 0;
const WorldCameraFinderProvider_1 = require("SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider");
const SessionController_1 = require("../../../../Core/SessionController");
const SyncKitLogger_1 = require("../../../../Utils/SyncKitLogger");
const MessageTextsEnum_1 = require("../../Texts/MessageTextsEnum");
const TextValues_1 = require("../../Texts/TextValues");
const TextMappingHint_1 = require("../../UI/MappingFlow/TextMappingHint/TextMappingHint");
const Tutorial_1 = require("../../UI/MappingFlow/Tutorial/Tutorial");
const TutorialTypeEnum_1 = require("../../UI/MappingFlow/Tutorial/TutorialTypeEnum");
const MappingCanceledState_1 = require("../MappingCanceledState/MappingCanceledState");
const MappingSuccessfulState_1 = require("../MappingSuccessfulState/MappingSuccessfulState");
const MappingUnsuccessfulState_1 = require("../MappingUnsuccessfulState/MappingUnsuccessfulState");
class JoiningState {
    constructor(input, stateMachine, projectContainer, onFlowComplete) {
        this.input = input;
        this.stateMachine = stateMachine;
        this.projectContainer = projectContainer;
        this.onFlowComplete = onFlowComplete;
        this.worldCamera = WorldCameraFinderProvider_1.default.getInstance();
        this.worldCameraTransform = this.worldCamera.getTransform();
        this.mappingWaitingTime = 30;
        this.log = new SyncKitLogger_1.SyncKitLogger(JoiningState.name);
        this.isFirstTimeMapping = true;
        this.tutorial = new Tutorial_1.Tutorial(input.tutorialNotificationInput, input.tutorialParametersInput);
        this.textMappingHint = new TextMappingHint_1.TextMappingHint(input.textMappingHintInput, input.textMappingHintTimingsInput);
        input.spinner.enabled = false;
        this.delayedEvent = input.script.createEvent("DelayedCallbackEvent");
        this.delayedEvent.bind(() => {
            stateMachine.enterState(MappingUnsuccessfulState_1.MappingUnsuccessfulState.name);
        });
    }
    enter() {
        if (this.isFirstTimeMapping) {
            if (SessionController_1.SessionController.getInstance().getCustomLandmark() !== null) {
                this.log.i(`Joining custom landmark`);
                this.tutorial.start(TutorialTypeEnum_1.TutorialTypeEnum.TutorialCustomLandmark);
                this.textMappingHint.start(TextValues_1.MAPPING_HINTS_CUSTOM_LANDMARK, this.tutorial.getDurationByAnimationType(TutorialTypeEnum_1.TutorialTypeEnum.TutorialCustomLandmark) + 3);
            }
            else {
                this.log.i(`Joining mapped area`);
                this.tutorial.start(TutorialTypeEnum_1.TutorialTypeEnum.TutorialP2);
                this.textMappingHint.start(TextValues_1.MAPPING_HINTS_P2, this.tutorial.getDurationByAnimationType(TutorialTypeEnum_1.TutorialTypeEnum.TutorialP2) + 3);
                // When using a mapped area, we may need to wait to retrieve the location id
                SessionController_1.SessionController.getInstance().notifyOnLocationId(() => {
                    if (this.stateMachine.currentState.name === MappingCanceledState_1.MappingCanceledState.name) {
                        return;
                    }
                    const locationId = SessionController_1.SessionController.getInstance().getColocatedMapId();
                    this.log.i(`Retrieving custom location (${locationId}`);
                    const retrieveLocation = (locationId) => global.deviceInfoSystem.isEditor()
                        ? this.retrieveLocationInEditor(locationId)
                        : this.retrieveLocationOnDevice(locationId);
                    retrieveLocation(locationId)
                        .then((location) => {
                        this.log.i(`Setting location to ${locationId}`);
                        this.log.i(`Location unique id: ${location.uniqueIdentifier}`);
                        this.locatedAtComponent.location = location;
                    })
                        .catch((error) => {
                        this.log.i(`Failed to retrieve location ${locationId}: ${error}`);
                    });
                });
            }
            this.input.spinner.enabled = true;
            this.locatedAtComponent = SessionController_1.SessionController.getInstance().getLocatedAtComponent();
            this.isFirstTimeMapping = false;
            this.delayedEvent.reset(this.mappingWaitingTime);
            // This should happen last, as it may immediately exit the state, resetting things that were
            // started above
            SessionController_1.SessionController.getInstance().notifyOnLocatedAtFound(() => {
                this.onLocatedAtFound();
            });
            if (global.deviceInfoSystem.isEditor()) {
                this.log.i(`Simulating location found`);
                this.onLocatedAtFound();
            }
        }
    }
    onLocatedAtFound() {
        if (this.stateMachine.currentState.name === MappingCanceledState_1.MappingCanceledState.name) {
            return;
        }
        this.onFlowComplete(false);
        this.projectContainer.startPointPosition = this.worldCameraTransform.getWorldPosition();
        const back = this.worldCameraTransform.back;
        back.y = 0;
        this.projectContainer.startPointRotation = quat.lookAt(back, vec3.up());
        SessionController_1.SessionController.getInstance().getSession().sendMessage(MessageTextsEnum_1.MessageTextsEnum.USER_ALIGNED);
        this.stateMachine.enterState(MappingSuccessfulState_1.MappingSuccessfulState.name);
    }
    exit() {
        this.delayedEvent.cancel();
        this.tutorial.stop();
        this.textMappingHint.stop();
        this.input.spinner.enabled = false;
    }
    async retrieveLocationInEditor(locationId) {
        // asset upload not implemented, so download would fail
        this.log.i(`Retrieving custom location [simulator] (${locationId})`);
        return LocationAsset.getAROrigin();
    }
    retrieveLocationOnDevice(locationId) {
        this.log.i(`Retrieving custom location (${locationId})`);
        return new Promise((resolve, reject) => {
            SessionController_1.SessionController.getInstance()
                .getLocationCloudStorageModule()
                .retrieveLocation(locationId, (location) => {
                resolve(location);
            }, (error) => {
                reject(new Error(error));
            });
        });
    }
}
exports.JoiningState = JoiningState;
//# sourceMappingURL=JoiningState.js.map