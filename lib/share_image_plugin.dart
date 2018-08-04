import 'dart:async';

import 'package:flutter/services.dart';

class ShareImagePlugin {
  static const MethodChannel _channel =
      const MethodChannel('share_image_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
