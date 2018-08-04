import Flutter
import UIKit
    
public class SwiftShareImagePlugin: NSObject, FlutterPlugin {

    static let SHARE_CHANNEL = "channel:app.bestsalary.shareimageplugin/share_image_plugin"
    static let SHARE_IMAGE = "shareImage"
    static let IMAGE = "image"
    static let TEXT = "text"
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: SHARE_CHANNEL, binaryMessenger: registrar.messenger())
    let instance = SwiftShareImagePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)

  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method.elementsEqual(SHARE_IMAGE)){
        let arguments = call.arguments as? NSDictionary
       let shareImagePath = arguments![IMAGE] as? String
        
        let imageURL = URL(shareImagePath)
        let image    = UIImage(contentsOfFile: imageURL.path)
        share(image)
    }
    result("iOS " + UIDevice.current.systemVersion)
  }
    
    func share(shareImage:UIImage){
        var img: UIImage = currentPhoto!
        var shareItems:Array = [img]
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityTypePrint, UIActivityTypePostToWeibo, UIActivityTypeCopyToPasteboard, UIActivityTypeAddToReadingList, UIActivityTypePostToVimeo]
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
}
