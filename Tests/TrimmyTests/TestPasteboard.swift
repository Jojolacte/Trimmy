import AppKit

func makeTestPasteboard() -> NSPasteboard {
    let name = NSPasteboard.Name("dev.steipete.trimmy-tests-\(UUID().uuidString)")
    let board = NSPasteboard(name: name)
    board.clearContents()
    return board
}
