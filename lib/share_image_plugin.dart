import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

const SHARE_CHANNEL =
    "channel:app.bestsalary.shareimageplugin/share_image_plugin";
const SHARE_IMAGE = "shareImage";
const IMAGE = "image";
const TEXT = "text";

class ShareImagePlugin {
  static const MethodChannel _channel = const MethodChannel(SHARE_CHANNEL);

  static Future<void> shareImage(String text, File image) async {
    final tempDir = await getTemporaryDirectory();

    File file = await image.copy('$tempDir/${image.path.split('/').last}');

    await _channel.invokeMethod(SHARE_IMAGE,
        <String, dynamic>{TEXT: text, IMAGE: file.path.split('/').last});
  }
}
