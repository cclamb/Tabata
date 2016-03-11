import Foundation

public struct GeneralInterval: Interval {
    
    public var interval: NSTimeInterval = 0.0
    public var description: String = ""
    
    public init(interval: NSTimeInterval, description: String) {
        self.interval = interval
        self.description = description
    }
    
    public init(objectToCopy: GeneralInterval) {
        self.description = objectToCopy.description
        self.interval = objectToCopy.interval
    }

}