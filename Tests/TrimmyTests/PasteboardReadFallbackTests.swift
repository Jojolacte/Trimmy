import AppKit
import Testing
@testable import Trimmy

@MainActor
@Suite(.serialized)
struct PasteboardReadFallbackTests {
    @Test
    func readsStringWhenOnlyPublicTextAvailable() {
        let settings = AppSettings()
        let pasteboard = makeTestPasteboard()
        let monitor = ClipboardMonitor(settings: settings, pasteboard: pasteboard)
        let item = NSPasteboardItem()
        item.setString("hello from rtf", forType: NSPasteboard.PasteboardType("public.text"))
        pasteboard.writeObjects([item])
        #expect(monitor.clipboardText() == "hello from rtf")
    }
}
