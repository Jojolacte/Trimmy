import AppKit
import Testing
@testable import Trimmy

@MainActor
@Suite(.serialized)
struct ManualTrimLastSummaryTests {
    @Test
    func manualTrimUpdatesLastEvenWhenNotCommand() {
        let settings = AppSettings()
        settings.autoTrimEnabled = false
        let pasteboard = makeTestPasteboard()
        let monitor = ClipboardMonitor(settings: settings, pasteboard: pasteboard)
        pasteboard.setString("just text", forType: .string)
        let didTrim = monitor.trimClipboardIfNeeded(force: true)
        #expect(didTrim)
        #expect(monitor.lastSummary.contains("just text"))
    }
}
