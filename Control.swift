import Foundation

public protocol Control {
    mutating func start()
    mutating func stop()
    mutating func restart()
    mutating func reset()
}