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
        //guard let arg = (methodCall.arguments) as! [String]).first else { return }
        
        if methodCall.method == "Printy"
        {
            result("Hi From Swift")
        }
    }
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
