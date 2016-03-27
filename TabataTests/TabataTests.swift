//
//  TabataTests.swift
//  TabataTests
//
//  Created by Lamb, Christopher Charles on 3/2/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import XCTest
import Timer
@testable import Tabata

class TabataTests: XCTestCase {
    
    var program = TimerProgram(
        name: "Test Program",
        description: "Some test program",
        program: [
            WorkInterval(interval: 20 * 100, description: "work"),
            RestInterval(interval: 10 * 100, description: "rest"),
            WorkInterval(interval: 20 * 100, description: "work"),
            RestInterval(interval: 10 * 100, description: "rest"),
            WorkInterval(interval: 20 * 100, description: "work"),
            RestInterval(interval: 10 * 100, description: "rest"),
            WorkInterval(interval: 20 * 100, description: "work"),
            RestInterval(interval: 10 * 100, description: "rest"),
            WorkInterval(interval: 20 * 100, description: "work"),
            RestInterval(interval: 10 * 100, description: "rest"),
            WorkInterval(interval: 20 * 100, description: "work"),
            RestInterval(interval: 10 * 100, description: "rest"),
        ])
    
    var timerManager = TimerManager<String,TimerEvent<GeneralInterval>>()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTimerCreation() {
        let timer = timerManager.createTimer(program)
        XCTAssertNotNil(timer)
        timerManager.deleteTimer(timer)
    }
    
    func testTimer() {
        let timer = timerManager.createTimer(program)
        let expectation = expectationWithDescription("events are fired")
        var callbackCnt = 0
        timer.addObserver("obs") { _ -> Void in
            callbackCnt++
            if callbackCnt > 5 {
                expectation.fulfill()
            }
        }
        timer.start()
        waitForExpectationsWithTimeout(50) { _ -> Void in
            timer.stop()
        }
        timerManager.deleteTimer(timer)
    }
    
}
