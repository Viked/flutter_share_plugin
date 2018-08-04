import Flutter
import UIKit
    
public class SwiftShareImagePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "share_image_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftShareImagePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)


  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
