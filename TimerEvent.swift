import Foundation

public struct TimerEvent<I: Interval>: Event {
    var _intervalsRemaining = 0.0
    var _intervalsElapsed = 0.0
    var _intervalSize = 1.0
    var _programIndex = 0
    var _program: TimerProgram<I>
    var _status = ProgramStatus.InProgress
    public init(
        intervalsElapsed: NSTimeInterval,
        intervalsRemaining: NSTimeInterval,
        intervalSize: NSTimeInterval,
        programIndex: Int,
        program: TimerProgram<I>,
        status: ProgramStatus) {
        _intervalsElapsed = intervalsElapsed
        _intervalsRemaining = intervalsRemaining
        _intervalSize = intervalSize
        _programIndex = programIndex
        _program = program
        _status = status
    }
    public var intervalsElapsed: NSTimeInterval {
        get {
            return _intervalsElapsed
        }
    }
    public var intervalsRemaining: NSTimeInterval {
        get {
            return _intervalsRemaining
        }
    }
    public var intervalSize: NSTimeInterval {
        get {
            return _intervalSize
        }
    }
    public var programIndex: Int {
        get {
            return _programIndex
        }
    }
    public var program: TimerProgram<I> {
        get {
            return _program
        }
    }
    public var status: ProgramStatus {
        get {
            return _status
        }
    }
}