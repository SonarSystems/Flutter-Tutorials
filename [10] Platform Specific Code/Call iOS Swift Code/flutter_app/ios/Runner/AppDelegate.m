#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include <Flutter/Flutter.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    FlutterViewController *controller = (FlutterViewController *) self.window.rootViewController;
    
    FlutterMethodChannel *CHANNEL = [FlutterMethodChannel methodChannelWithName:@"com.flutter.epic/epic" binaryMessenger:controller];
    
    [CHANNEL setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result)
    {
        if ([@"Printy" isEqualToString:call.method])
        {
            result(@"Hi From Objective-C");
        }
    }];

  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
