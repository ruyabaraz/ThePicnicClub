import {Interactable} from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable"
import NativeLogger from "SpectaclesInteractionKit.lspkg/Utils/NativeLogger"
import {findSceneObjectByName} from "SpectaclesInteractionKit.lspkg/Utils/SceneObjectUtils"
import {validate} from "SpectaclesInteractionKit.lspkg/Utils/validate"
import {RocketConfigurator} from "./RocketConfigurator"

const TAG = "RocketScrollViewItem"
const log = new NativeLogger(TAG)

@component
export class RocketScrollViewItem extends BaseScriptComponent {
  @input
  style!: Text // This can be used to identify which item was selected (e.g., "Croissant", "Cake")

  private interactable: Interactable | null = null
  private backingImage: Image | undefined
  private rocketConfigurator: RocketConfigurator | null = null

  onAwake(): void {}

  init(rocketConfigurator: RocketConfigurator): void {
    this.rocketConfigurator = rocketConfigurator
    this.registerRocketListItemBacking()

    validate(this.backingImage)
    this.interactable = this.backingImage.sceneObject.getComponent(Interactable.getTypeName())
    if (isNull(this.interactable)) log.f("Interactable component not found!")

    this.setupCallbacks()
  }

  private setupCallbacks(): void {
    validate(this.interactable)
    this.interactable.onTriggerEnd.add(this.onTriggerEndEvent)
  }

  private onTriggerEndEvent = (): void => {
    validate(this.rocketConfigurator)
    this.rocketConfigurator.setRocketPartSection(this.style.text)
  }

  private registerRocketListItemBacking(): void {
    const backingObject: SceneObject | null = findSceneObjectByName(this.sceneObject, "Background")
    validate(backingObject)

    this.backingImage = backingObject.getComponent("Image")
    validate(this.backingImage, "Backing image is undefined!")

    this.backingImage.mainMaterial = this.backingImage.mainMaterial.clone()

    validate(this.rocketConfigurator)
    this.rocketConfigurator.registerRocketListItemBacking(this.style.text, this.backingImage)
  }
}