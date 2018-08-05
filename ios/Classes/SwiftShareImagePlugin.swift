import Flutter
import UIKit
    
public class SwiftShareImagePlugin: NSObject, FlutterPlugin {

    static let SHARE_CHANNEL = "channel:app.bestsalary.shareimageplugin/share_image_plugin"
    static let SHARE_IMAGE = "shareImage"
    static let IMAGE = "image"
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: SwiftShareImagePlugin.SHARE_CHANNEL, binaryMessenger: registrar.messenger())
    let instance = SwiftShareImagePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)

  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method.elementsEqual(SwiftShareImagePlugin.SHARE_IMAGE)){
        let arguments = call.arguments as? NSDictionary
       let shareImagePath = arguments![SwiftShareImagePlugin.IMAGE] as? String
        
        let imageURL = URL(shareImagePath)
        let image    = UIImage(contentsOfFile: imageURL.path)
        share(image)
    }
    result("iOS " + UIDevice.current.systemVersion)
  }
    
    func share(shareImage:UIImage){
        var img: UIImage = shareImage!
        var shareItems:Array = [img]
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityType.print, UIActivityType.postToWeibo, UIActivityType.copyToPasteboard, UIActivityType.addToReadingList, UIActivityType.postToVimeo]
        self.present(activityViewController, animated: true, completion: nil)
    }
}
