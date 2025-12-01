import Foundation
import KeyboardShortcuts
import Testing

@MainActor
@Suite struct KeyboardShortcutsBundleTests {
    @Test func recorderInitializesWithoutCrashing() {
        // Regression for missing KeyboardShortcuts resource bundle: constructing the recorder used to trap
        // when Bundle.module could not be resolved in packaged builds.
        _ = KeyboardShortcuts.RecorderCocoa(for: .init("test.keyboardshortcuts.bundle"))
    }
}
