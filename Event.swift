import Foundation

public protocol Event {
    init(secondsElapsed: NSTimeInterval)
    var secondsElapsed: NSTimeInterval { get }
}