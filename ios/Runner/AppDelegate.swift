import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let getTempChannel = FlutterMethodChannel(
      name: "get_temp_channel",
      binaryMessenger: controller.binaryMessenger)
    getTempChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      guard call.method == "getTemp" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.getTemp(result: result)
      // This method is invoked on the UI thread.
      // Handle battery messages.
    })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  private func getTemp(result: FlutterResult) {
    result(Int.random(in: 15...70))
  }
}
