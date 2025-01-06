import { RNPackage } from '@rnoh/react-native-openharmony/ts';
import type {
  DescriptorWrapperFactoryByDescriptorTypeCtx,
  DescriptorWrapperFactoryByDescriptorType
} from '@rnoh/react-native-openharmony/ts';
import { RNC } from "./generated/ts"

export class RNCImageCapInsetsPackage extends RNPackage {
  createDescriptorWrapperFactoryByDescriptorType(
    ctx: DescriptorWrapperFactoryByDescriptorTypeCtx
  ): DescriptorWrapperFactoryByDescriptorType {

    return {
      [RNC.RNCImageCapInset.NAME]: (ctx) =>
      new RNC.RNCImageCapInset.DescriptorWrapper(ctx.descriptor),
    };
  }
}