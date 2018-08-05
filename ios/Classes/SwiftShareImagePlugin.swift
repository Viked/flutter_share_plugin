import Flutter
import UIKit
    
public class SwiftShareImagePlugin: NSObject, FlutterPlugin {

    static let SHARE_CHANNEL = "channel:app.bestsalary.shareimageplugin/share_image_plugin"
    static let SHARE_IMAGE = "shareImage"
    static let IMAGE = "image"
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: SwiftShareImagePlugin.SHARE_CHANNEL, binaryMessenger: registrar.messenger())
    let appDelegate = UIApplication.shared.delegate
    let instance = SwiftShareImagePlugin.init(viewController:appDelegate!.window!.rootViewController)
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    let viewController : UIViewController

    init(viewController:UIViewController){
     self.viewController = viewController
    }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method.elementsEqual(SwiftShareImagePlugin.SHARE_IMAGE)){
        let arguments = call.arguments as? NSDictionary
        let shareImageName = arguments![SwiftShareImagePlugin.IMAGE] as! String
        let documentsPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]

        let imageURL = URL(fileURLWithPath:documentsPath).appendingPathComponent(shareImageName)
        let image    = UIImage(contentsOfFile: imageURL.path)
        share(shareImage:image!)
    }
    result("iOS " + UIDevice.current.systemVersion)
  }
    
    func share(shareImage:UIImage){
        let shareItems:Array = [shareImage]
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityType.print, UIActivityType.postToWeibo, UIActivityType.copyToPasteboard, UIActivityType.addToReadingList, UIActivityType.postToVimeo]
        viewController.present(activityViewController, animated: true, completion: nil)
    }
}
