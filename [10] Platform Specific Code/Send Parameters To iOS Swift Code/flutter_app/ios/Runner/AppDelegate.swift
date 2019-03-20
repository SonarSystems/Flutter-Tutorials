import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let CHANNEL = FlutterMethodChannel(name: "com.flutter.epic/epic", binaryMessenger: controller)
    
    CHANNEL.setMethodCallHandler { [unowned self] (methodCall, result) in        
        if methodCall.method == "Printy"
        {
            guard let args = methodCall.arguments else
            {
                return
            }
            
            let myArgs = args as? [String: Any]
            let val1 = myArgs?["val1"] as? String
            
            if val1 == "1"
            {
                result("YAY from Swift")
            }
            else
            {
                result("NAY")
            }
        }
    }
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
