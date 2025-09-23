import UIKit
import Flutter
import NielsenAppApi

@main
@objc class AppDelegate: FlutterAppDelegate {

  var nielsenAppApi: NielsenAppApi?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
        
        channel.setMethodCallHandler { [weak self] call, result in
            switch call.method {
            case "init":
                guard let args = call.arguments as? [String: Any],
                      let appId = args["appId"] as? String,
                      !appId.isEmpty else {
                    result(FlutterError(code: "INVALID_ARGUMENT", message: "appId is null or empty", details: nil))
                    return
                }
                self?.initNielsenSdk(appId: appId)
                result("Nielsen SDK initialized with appId: \(appId)")
                
            case "play":
                let metadata = (call.arguments as? [String: Any])?["metadata"] as? [String: String] ?? [:]
                self?.play(metadata: metadata)
                result("Play event sent")
                
            case "stop":
                self?.stop()
                result("Stop event sent")
                
            case "loadMetadata":
                guard let args = call.arguments as? [String: Any],
                      let metadata = args["metadata"] as? [String: String],
                      !metadata.isEmpty else {
                    result(FlutterError(code: "INVALID_ARGUMENT", message: "metadata is null or empty", details: nil))
                    return
                }
                self?.loadMetadata(metadata: metadata)
                result("Metadata loaded")
            
            case "end":
                self?.end()
                result("End session called")

            case "setPlayheadPosition":
                let position = (call.arguments as? [String: Any])?["position"] as? Int ?? 0
                self?.setPlayheadPosition(position: position)
                result("Playhead position set to \(position)")
                
            default:
                result(FlutterMethodNotImplemented)
            }
        }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // MARK: - Nielsen SDK Init
    private func initNielsenSdk(appId: String) {
        let appInformation: [String: String] = [
            "appid": appId,
            "sfcode": "us",          // เปลี่ยนตาม TAM กำหนด เช่น "ap"
            "nol_devDebug": "DEBUG"  // DEBUG ตอน dev เท่านั้น
        ]
        
        nielsenAppApi = NielsenAppApi(appInfo: appInformation, delegate: nil)
        NSLog("NielsenSDK Initialized with appId=\(appId)")
    }
    
    // MARK: - Play Event
    private func play(metadata: [String: String]) {
        nielsenAppApi?.play(metadata)
        NSLog("NielsenSDK Play event: \(metadata)")
    }
    
    // MARK: - Stop Event
    private func stop() {
        nielsenAppApi?.stop()
        NSLog("NielsenSDK Stop event sent")
    }
    
    // MARK: - Load Metadata
    private func loadMetadata(metadata: [String: String]) {
        nielsenAppApi?.loadMetadata(metadata)
        NSLog("NielsenSDK Metadata loaded: \(metadata)")
    }

     // MARK: - End Session
    private func end() {
        nielsenAppApi?.stop()
        nielsenAppApi = nil
        NSLog("NielsenSDK End session")
    }

    // MARK: - Set Playhead Position
    private func setPlayheadPosition(position: Int) {
        nielsenAppApi?.setPlayheadPosition(Int64(position))
        NSLog("NielsenSDK Playhead position set: \(position)")
    }
}
