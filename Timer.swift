/**
# Timer
=========
 This is a timer class that will send notifications of a running program at specific intervals based on 
 the configuration of the class.
 
*/
import Foundation

func defaultFirePolicy<T: Hashable, S: Event>(
    myTimer: NSTimer,
    inout timerState: TimerState,
    timer: Timer<T, S>,
    observer: GeneralObserver<T, S>
    ) -> Void {
        
        if timerState.stopTimer {
            myTimer.invalidate()
            timerState.stopTimer = false
            return
        }
        
        if timerState.restartTimer {
            timerState.elapsedSeconds = 0
            timerState.restartTimer = false
            timer.start()
        }
        
        timerState.elapsedSeconds++
        
        let ti = NSTimeInterval(timerState.elapsedSeconds)
        let event = S(secondsElapsed: ti)
        observer.notify(event)
        
        if timerState.elapsedSeconds >= 10 {
            myTimer.invalidate()
        }
}

public final class Timer<T: Hashable, S: Event>: Control {
    
    public typealias TimerPolicy = (NSTimer, inout TimerState, Timer<T, S>, GeneralObserver<T, S>) -> Void
    
    private var interval: NSTimeInterval
    private weak var timer: NSTimer?
    private var timerState = TimerState()
    private var firePolicy: TimerPolicy
    private var observerManager = GeneralObserver<T,S>()
    
    
    public init(
        interval: NSTimeInterval = 1.0,
        firePolicy: TimerPolicy = defaultFirePolicy
    ) {
        self.interval = interval
        self.firePolicy = firePolicy
    }
    
    public func addObserver(key: T, observer:(S) -> Void) {
        observerManager.addObserver(key, observer: observer)
    }
    
    public func removeObserver(key: T) {
        observerManager.removeObserver(key)
    }
    
    public func start() {
        timer = NSTimer.scheduledTimerWithTimeInterval(
            interval,
            target: self,
            selector: Selector("timerFire:"),
            userInfo: nil,
            repeats: true)
    }
    
    public func stop() {
        timerState.stopTimer = true
    }
    
    public func restart() {
        timerState.stopTimer = true
        timerState.restartTimer = true
    }
    
    public func reset() {
        timerState.stopTimer = true
        
    }
    
    dynamic func timerFire(myTimer: NSTimer) {
        firePolicy(myTimer, &timerState, self, self.observerManager)
    }
    
}