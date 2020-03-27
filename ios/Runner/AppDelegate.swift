import UIKit
import Flutter
import workmanager

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    static func registerPlugins(with registry: FlutterPluginRegistry){
        GeneratedPluginRegistrant.register(with: registry)
    }
  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    UIApplication.shared.setMinimumBackgroundFetchInterval(TimeInterval(60*15))
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
    }
    
    AppDelegate.registerPlugins(with: self)
    WorkmanagerPlugin.setPluginRegistrantCallback{registry in
        AppDelegate.registerPlugins(with: registry)
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
