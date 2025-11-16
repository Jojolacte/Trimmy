import Foundation
import Testing
@testable import Trimmy

@MainActor
@Suite
struct TrimmyTests {
    @Test
    func detectsMultiLineCommand() {
        let settings = AppSettings()
        let detector = CommandDetector(settings: settings)
        let text = "echo hi\nls -la\n"
        #expect(detector.transformIfCommand(text) == "echo hi ls -la")
    }

    @Test
    func skipsSingleLine() {
        let settings = AppSettings()
        let detector = CommandDetector(settings: settings)
        #expect(detector.transformIfCommand("ls -la") == nil)
    }

    @Test
    func skipsLongCopies() {
        let settings = AppSettings()
        let detector = CommandDetector(settings: settings)
        let blob = Array(repeating: "echo hi", count: 11).joined(separator: "\n")
        #expect(detector.transformIfCommand(blob) == nil)
    }

    @Test
    func preservesBlankLinesWhenEnabled() {
        let settings = AppSettings()
        settings.preserveBlankLines = true
        let detector = CommandDetector(settings: settings)
        let text = "echo hi\n\necho bye\n"
        #expect(detector.transformIfCommand(text) == "echo hi\n\necho bye")
    }
}
