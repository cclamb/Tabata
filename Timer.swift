/**
# Timer
=========
 This is a timer class that will send notifications of a running program at specific intervals based on 
 the configuration of the class.
 
*/
import Foundation

func defaultFirePolicy<T: Hashable, S: Event, I: Interval>(
    myTimer: NSTimer,
    inout timerState: TimerState,
    timer: Timer<T, S, I>,
    observer: GeneralObserver<T, S>,
    programManager: ProgramManager<S,I>
    ) -> Void {
        
        if timerState.stopTimer {
            myTimer.invalidate()
            timerState.stopTimer = false
            return
        }
        
        if timerState.restartTimer {
            programManager.currentCnt = 0
            programManager.totalCnt = 0
            timerState.restartTimer = false
            timer.start()
        }
        
        let event = programManager.notify()
        observer.notify(event)
        if event.status == .Complete {
            myTimer.invalidate()
        }
}

public final class Timer<T: Hashable, S: Event, I: Interval where S.IntervalType == I>
    : Observer, Control {
    
    public typealias TimerPolicy = (NSTimer,
        inout TimerState, Timer<T, S, I>,
        GeneralObserver<T, S>,
        ProgramManager<S,I>) -> Void
    
    private weak var timer: NSTimer?
    
    private var firePolicy: TimerPolicy
    private var programManager: ProgramManager<S,I>
    private var interval: NSTimeInterval
    
    private var timerState = TimerState()
    private var observerManager = GeneralObserver<T,S>()
    
    
    
    public init(
        program: TimerProgram<I>,
        interval: NSTimeInterval = 1.0,
        firePolicy: TimerPolicy = defaultFirePolicy
    ) {
        self.interval = interval
        programManager = ProgramManager<S,I>(program: program, intervalSize: interval)
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
        firePolicy(myTimer, &timerState, self, self.observerManager, self.programManager)
    }
    
}