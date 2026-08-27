import Foundation
import IO

struct TimecodeTestWorkspace {
    let root: URL

    init(
        _ name: String
    ) throws {
        root = URL(
            fileURLWithPath: NSTemporaryDirectory(),
            isDirectory: true
        )
        .appendingPathComponent(
            "timecode-test-\(name)-\(UUID().uuidString)",
            isDirectory: true
        )
        .standardizedFileURL

        try FileSystem.default.directory.create(
            root
        )
    }

    func directory(
        _ name: String
    ) -> URL {
        root.appendingPathComponent(
            name,
            isDirectory: true
        )
    }

    func file(
        _ name: String
    ) -> URL {
        root.appendingPathComponent(
            name
        )
    }

    func remove() {
        try? FileSystem.default.remove(
            root
        )
    }
}
