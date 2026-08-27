import TestFlows

enum TimecodeFlowSuite: TestFlowRegistry {
    static let title = "Timecode"

    static let flows: [TestFlow] = [
        ltcFlow,
    ]
}
