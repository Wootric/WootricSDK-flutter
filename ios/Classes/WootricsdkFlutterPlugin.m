#import "WootricsdkFlutterPlugin.h"
#if __has_include(<wootricsdk_flutter/wootricsdk_flutter-Swift.h>)
#import <wootricsdk_flutter/wootricsdk_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "wootricsdk_flutter-Swift.h"
#endif

@implementation WootricsdkFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftWootricsdkFlutterPlugin registerWithRegistrar:registrar];
}
@end
