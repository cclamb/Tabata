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
        firePolicy: Timer<K,S>.TimerPolicy? = nil
        ) -> Timer<K,S> {
            var timer: Timer<K,S>!
            if let myFirePolicy = firePolicy {
                timer = Timer<K,S>(program: program, interval: interval, firePolicy: myFirePolicy)
            } else {
                timer = Timer<K,S>(program: program, interval: interval)
            }
            timers.append(timer!)
            return timer;
    }
    
    public func deleteTimer(
        timer: Timer<K,S>
    ) {
        timer.stop()
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
    
    public func reset() {
        assertionFailure()
    }
}

typealias SimpleEvent = TimerEvent<GeneralInterval>
typealias SimpleTimer = Timer<String,SimpleEvent>
typealias SimpleTimerManager = TimerManager<String,SimpleEvent>