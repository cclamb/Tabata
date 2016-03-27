//
//  TimerManager.swift
//  Tabata
//
//  Created by Lamb, Christopher Charles on 3/8/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import Foundation
import Timer

public class TimerManager<K: Hashable, S: Event>: Control {
    
    typealias I = S.IntervalType
    
    private var timers: [Control] = []
    
    public func createTimer(
        program: TimerProgram<I>,
        interval: NSTimeInterval = 0.01,
        firePolicy: Timer<K,S,I>.TimerPolicy? = nil
        ) -> Timer<K,S,I> {
            var timer: Timer<K,S,I>!
            if let myFirePolicy = firePolicy {
                timer = Timer<K,S,I>(program: program, interval: interval, firePolicy: myFirePolicy)
            } else {
                timer = Timer<K,S,I>(program: program, interval: interval)
            }
            timers.append(timer!)
            return timer;
    }
    
    public func deleteTimer(
        timer: Timer<K,S,I>
    ) {
        timer.stop()
        let idx = timers.indexOf {
            let ctrl: Timer<K,S,I>? = $0 as? Timer<K,S,I>
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