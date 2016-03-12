import Foundation

public struct TimerState {
    public init(stopTimer: Bool, restartTimer: Bool) {
        self.stopTimer = stopTimer
        self.restartTimer = restartTimer
    }
    public var stopTimer: Bool
    public var restartTimer: Bool
}