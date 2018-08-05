import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

const SHARE_CHANNEL =
    "channel:app.bestsalary.shareimageplugin/share_image_plugin";
const SHARE_IMAGE = "shareImage";
const IMAGE = "image";
const TEXT = "text";

class ShareImagePlugin {
  static const MethodChannel _channel = const MethodChannel(SHARE_CHANNEL);

  static Future<void> shareImage(String text, File image) async {
    await _channel.invokeMethod(SHARE_IMAGE,
        <String, dynamic>{TEXT: text, IMAGE: image.path.split('/').last});
  }
}
