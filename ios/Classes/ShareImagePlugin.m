#import "ShareImagePlugin.h"
#import <share_image_plugin/share_image_plugin-Swift.h>

@implementation ShareImagePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftShareImagePlugin registerWithRegistrar:registrar];
}
@end
