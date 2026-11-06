import Foundation
import AppKit
import Monitor

let defaultWindowSize = NSSize(width: 540, height: 540)

class MonitorEngine {
    static let shared = MonitorEngine()
    static let slackBundleId = "com.tinyspeck.slackmacgap"
    static let slackAppName = "Slack"
    private var statusBar: StatusBarController?

    private init() {}

    func setup() {
        guard statusBar == nil else { return }
        MonitorService.setupObservers()
        let controller = StatusBarController()
        controller.monitorApp(app: MonitoredApp(Self.slackBundleId, appName: Self.slackAppName))
        statusBar = controller
    }
}

class MonitoredApp {
    let bundleId: String
    let appName: String

    init(_ bundleId: String, appName: String) {
        self.bundleId = bundleId
        self.appName = appName
    }
}
