import Foundation

public struct TimerEvent: Event {
    var _secondsElapsed = 0.0
    public init(secondsElapsed: NSTimeInterval) {
        _secondsElapsed = secondsElapsed
    }
    public var secondsElapsed: NSTimeInterval{
        get {
            return _secondsElapsed
        }
    }
}