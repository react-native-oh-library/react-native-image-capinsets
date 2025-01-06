import { RNComponentContext, RNViewBase } from '@rnoh/react-native-openharmony';
import { RNC } from "./generated";

@Component
export struct RNCImageCapInsets {
  public static readonly NAME = RNC.RNCImageCapInset.NAME
  //
  public ctx!: RNComponentContext
  public tag: number = 0
  @State private descriptorWrapper: RNC.RNCImageCapInset.DescriptorWrapper = {} as RNC.RNCImageCapInset.DescriptorWrapper
  private eventEmitter: RNC.RNCImageCapInset.EventEmitter | undefined = undefined
  private cleanUpCallbacks: (() => void)[] = []
  @State src: PixelMap | ResourceStr| DrawableDescriptor = ''
  @State capInsets: EdgeWidths = {}
  @State isUri: boolean = false

  aboutToAppear() {
    this.eventEmitter = new RNC.RNCImageCapInset.EventEmitter(this.ctx.rnInstance, this.tag)
    this.onDescriptorWrapperChange(this.ctx.descriptorRegistry.findDescriptorWrapperByTag<RNC.RNCImageCapInset.DescriptorWrapper>(this.tag)!)
    this.cleanUpCallbacks.push(this.ctx.descriptorRegistry.subscribeToDescriptorChanges(this.tag,
      (_descriptor, newDescriptorWrapper) => {
        this.onDescriptorWrapperChange(newDescriptorWrapper! as RNC.RNCImageCapInset.DescriptorWrapper)
      }
    ))
  }

  private onDescriptorWrapperChange(descriptorWrapper: RNC.RNCImageCapInset.DescriptorWrapper) {
    this.descriptorWrapper = descriptorWrapper
    const source = this.descriptorWrapper.props.source as Record<string, string>
    this.isUri = String(source?.uri).startsWith('asset://') ? false :true
    this.src = (this.isUri ?
      source?.uri :
      (source?.uri?.replace('asset://', this.ctx.rnInstance.getAssetsDest()))) || '' as ResourceStr
    this.capInsets = this.descriptorWrapper.props.capInsets || {}
  }

  aboutToDisappear() {
    this.cleanUpCallbacks.forEach(cb => cb())
  }

  build() {
    RNViewBase({ ctx: this.ctx, tag: this.tag }) {
      Image(this.isUri? this.src : $rawfile(String(this.src)))
        .objectFit(ImageFit.Fill)
        .resizable({
          slice: {
            top: this.capInsets.top,
            bottom: this.capInsets.bottom,
            right: this.capInsets.right,
            left: this.capInsets.left,
          }
        })
    }
  }
}