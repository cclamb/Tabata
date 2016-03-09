import Foundation

public protocol Observer {
    typealias KeyType
    typealias EventType
    mutating func addObserver(key: KeyType, observer: (EventType) -> Void)
    mutating func removeObserver(key: KeyType)
}