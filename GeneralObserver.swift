import Foundation

public final class GeneralObserver<K: Hashable, E>: Observer {
    
    public typealias ObserverType = (E) -> Void
    
    var observers: [K: ObserverType] = [:]
    
    public init() {}
    
    public func addObserver(key: K, observer: ObserverType) {
        observers[key] = observer
    }
    
    public func removeObserver(key: K) {
        observers.removeValueForKey(key)
    }
    
    public func notify(event: E) {
        observers.forEach {
            $1(event)
        }
    }
}