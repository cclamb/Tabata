//
//  TimerManager.swift
//  Tabata
//
//  Created by Lamb, Christopher Charles on 3/8/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import Foundation

public class TimerManager: Control {
    
    private var timers: [Control] = []
    
    public func createTimer<K: Hashable,S>(interval: NSTimeInterval, firePolicy: Timer<K,S>.TimerPolicy? = nil) -> Timer<K,S> {
        var timer: Timer<K,S>!
        if let myFirePolicy = firePolicy {
            timer = Timer<K,S>(interval: interval, firePolicy: myFirePolicy)
        } else {
            timer = Timer<K,S>(interval: interval)
        }
        timers.append(timer)
        return timer;
    }
    
    public func deleteTimer<K: Hashable,S>(timer: Timer<K,S>) {
        let idx = timers.indexOf {
            let ctrl: Timer<K,S>? = $0 as? Timer<K,S>
            if let myControl = ctrl {
                return myControl === timer
            } else {
                return false
            }
        }
        
        if let myIdx = idx {
            timers.removeAtIndex(myIdx)
        }
        
    }
    
    public func start() {
        timers.forEach {(var control: Control) in control.start() }
    }
    
    public func stop() {
        timers.forEach {(var control: Control) in control.stop() }
    }
    
    public func restart() {
        timers.forEach {(var control: Control) in control.restart() }
    }
    
    public func reset() {
        timers.forEach {(var control: Control) in control.reset() }
    }
}