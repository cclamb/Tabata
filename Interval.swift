import Foundation

public protocol Interval {
    init(interval: NSTimeInterval, description: String)
    init(objectToCopy: Self)
    var interval: NSTimeInterval { get set }
    var description: String { get set }
}