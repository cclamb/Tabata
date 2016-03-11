import Foundation

public final class ProgramManager<E: Event, I: Interval>{
    
    private var program: [I]
    private var currentInterval: I?
    private var currentIdx = 0
    
    public var currentCnt = 0.0
    public var totalCnt = 0.0
    public var intervalSize = 0.01
    
    public init(program: [I], intervalSize: NSTimeInterval = 0.01) {
        self.program = program
        self.intervalSize = intervalSize
    }
    
    public func notify() -> E {
        
        switch checkProgramState() {
        case .Complete:
            return E(
                intervalsElapsed: currentCnt,
                intervalsRemaining: 0,
                intervalSize: intervalSize,
                status: .Complete)
        case .InProgress:
            currentCnt++
            totalCnt++
            return E(
                intervalsElapsed: currentCnt,
                intervalsRemaining: currentInterval!.interval - currentCnt,
                intervalSize: intervalSize,
                status: .InProgress
            )
        case .IntervalStarting:
            currentCnt++
            totalCnt++
            return E(
                intervalsElapsed: currentCnt,
                intervalsRemaining: currentInterval!.interval - currentCnt,
                intervalSize: intervalSize,
                status: .IntervalStarting
            )
        case .Starting:
            currentCnt++
            totalCnt++
            return E(
                intervalsElapsed: currentCnt,
                intervalsRemaining: currentInterval!.interval - currentCnt,
                intervalSize: intervalSize,
                status: .Starting
            )
        }
    }
    
    private func checkProgramState() -> ProgramStatus {
        if checkProgramFinished() == true {
            return .Complete
        }
        let startStatus = checkCurrentInterval()
        let intervalStatus = checkIntervalState()
        if startStatus == .Starting {
            return .Starting
        } else {
            return intervalStatus
        }
    }
    
    private func checkProgramFinished() -> Bool {
        return currentIdx >= program.count ? true : false
    }
    
    private func checkCurrentInterval() -> ProgramStatus {
        if currentInterval == nil {
            currentInterval = program[currentIdx++]
            return .Starting
        }
        return .InProgress
    }
    
    private func checkIntervalState() -> ProgramStatus {
        guard let myCurrentInterval = currentInterval else {
            return .InProgress
        }
        
        if currentCnt >= myCurrentInterval.interval {
            currentInterval = program[currentIdx++]
            currentCnt = 0
            return .IntervalStarting
        }
        return .InProgress
    }
    
}