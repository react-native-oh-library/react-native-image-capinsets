import { HostComponent, ViewProps } from "react-native";
import codegenNativeComponent from "react-native/Libraries/Utilities/codegenNativeComponent";
import {Double, WithDefault} from 'react-native/Libraries/Types/CodegenTypes';
import {UnsafeMixed} from './codegenUtils'

export interface ImageURISource {
  uri?: string | undefined;
  bundle?: string | undefined;
  method?: string | undefined;
  headers?: UnsafeMixed<ReadonlyArray<Readonly<{name: string, value: string}>>>;
  cache?: WithDefault<'default' | 'reload' | 'force-cache' | 'only-if-cached', 'default'>;
  body?: string | undefined;
  width?: Double | undefined;
  height?: Double | undefined;
  scale?: Double | undefined;
}

type Inset = {
  top?: Double | null;
  left?: Double | null;
  right?: Double | null;
  bottom?: Double | null;
}

export interface NativeProps extends ViewProps {
  source: UnsafeMixed<ImageURISource>;
  capInsets: UnsafeMixed<Inset>;
}

export default codegenNativeComponent<NativeProps>(
  "RNCImageCapInset"
) as HostComponent<NativeProps>;
