import Arguments

@main
enum TimecodeCommand: ArgumentCommand {
    static let name = "timecode"
    static let defaultChild = Help.self

    static let children: [ArgumentCommandType] = [
        Help.self,
        LTCCommand.Probe.self,
        LTCCommand.Remux.self,
    ]

    enum Help: RunnableArgumentCommand {
        static let name = "help"

        static func run(
            _ invocation: ParsedInvocation
        ) async throws {
            print(
                ArgumentHelpRenderer().render(
                    command: try TimecodeCommand.spec()
                )
            )
        }
    }

    static func main() async {
        await ArgumentProgram.main(
            command: Self.self
        )
    }
}
