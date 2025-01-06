#pragma once

#include "RNOH/generated/BaseReactNativeImageCapinsetsPackage.h"

namespace rnoh {

class ImageCapinsetsPackage : public BaseReactNativeImageCapinsetsPackage {
    using Super = BaseReactNativeImageCapinsetsPackage;

public:
    ImageCapinsetsPackage(Package::Context ctx) : Super(ctx) {}
};
} // namespace rnoh