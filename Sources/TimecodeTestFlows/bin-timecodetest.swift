import TestFlows

@main
enum TimecodeTestFlowsMain {
    static func main() async {
        await TestFlowCLI.run(
            suite: TimecodeFlowSuite.self
        )
    }
}
