import Foundation

public protocol Event {
    init(
        intervalsElapsed: NSTimeInterval,
        intervalsRemaining: NSTimeInterval,
        intervalSize: NSTimeInterval,
        status: ProgramStatus
    )
    var intervalsElapsed: NSTimeInterval { get }
    var intervalsRemaining: NSTimeInterval { get }
    var intervalSize: NSTimeInterval { get }
    var status: ProgramStatus { get }
}