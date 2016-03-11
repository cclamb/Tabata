import Foundation

public struct TimerEvent: Event {
    var _intervalsRemaining = 0.0
    var _intervalsElapsed = 0.0
    var _intervalSize = 1.0
    var _status = ProgramStatus.InProgress
    public init(
        intervalsElapsed: NSTimeInterval,
        intervalsRemaining: NSTimeInterval,
        intervalSize: NSTimeInterval,
        status: ProgramStatus) {
        _intervalsElapsed = intervalsElapsed
        _intervalsRemaining = intervalsRemaining
        _intervalSize = intervalSize
        _status = status
    }
    public var intervalsElapsed: NSTimeInterval{
        get {
            return _intervalsElapsed
        }
    }
    public var intervalsRemaining: NSTimeInterval{
        get {
            return _intervalsRemaining
        }
    }
    public var intervalSize: NSTimeInterval{
        get {
            return _intervalSize
        }
    }
    public var status: ProgramStatus {
        get {
            return _status
        }
    }
}