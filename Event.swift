import Foundation

public protocol Event {
    typealias IntervalType: Interval
    init(
        intervalsElapsed: NSTimeInterval,
        intervalsRemaining: NSTimeInterval,
        intervalSize: NSTimeInterval,
        programIndex: Int,
        program: TimerProgram<IntervalType>,
        status: ProgramStatus
    )
    var intervalsElapsed: NSTimeInterval { get }
    var intervalsRemaining: NSTimeInterval { get }
    var intervalSize: NSTimeInterval { get }
    var programIndex: Int { get }
    var program: TimerProgram<IntervalType> { get }
    var status: ProgramStatus { get }
}