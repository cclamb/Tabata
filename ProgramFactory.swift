//
//  StockProgram.swift
//  Tabata
//
//  Created by Lamb, Christopher Charles on 3/17/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import Foundation

public typealias GeneralProgram = TimerProgram<GeneralInterval>

public struct ProgramFactory {
    
    private static var TabataInterval = 12
    
    private static var HIITInterval = 6
    
    private static var BoxingInterval = 15
    
    public static var Tabata = ProgramFactory.buildTabata(TabataInterval)
    
    public static var EmptyProgram = ProgramFactory.buildEmptyProgram()
    
    public static var HIIT = ProgramFactory.buildHIIT(HIITInterval)
    
    public static var Boxing = ProgramFactory.buildBoxing(BoxingInterval)
    
    private static func buildTabata(intervalCount: Int) -> GeneralProgram {
        return GeneralProgram(
            name: "\(intervalCount) Round Tabata",
            description: "This is a \(intervalCount) round Tabata program.",
            program: buildIntervals(
                workIntervals: (0..<intervalCount).map { _ in return 20 * 100 },
                restIntervals: (0..<intervalCount).map { _ in return 10 * 100 }
            )
        )
    }
    
    private static func buildEmptyProgram() -> GeneralProgram {
        return GeneralProgram(
            name: "New Program",
            description: "A new program - please update me! I'm empty!",
            program: []
        )
    }
    
    private static func buildHIIT(intervalCount: Int) -> GeneralProgram {
        return GeneralProgram(
            name: "\(intervalCount) Round HIIT",
            description: "This is a \(intervalCount) round HIIT program.",
            program: buildIntervals(
                workIntervals: (0..<intervalCount).map { _ in return 60 * 100 },
                restIntervals: (0..<intervalCount).map { _ in return 20 * 100 }
            )
        )
    }
    
    private static func buildBoxing(intervalCount: Int) -> GeneralProgram {
        return GeneralProgram(
            name: "\(intervalCount) Round Boxing",
            description: "This is a \(intervalCount) round boxing program.",
            program: buildIntervals(
                workIntervals: (0..<intervalCount).map { _ in return 180 * 100 },
                restIntervals: (0..<intervalCount).map { _ in return 60 * 100 }
            )
        )
    }
    
    private static func buildIntervals(
            workIntervals workIntervals: [NSTimeInterval],
            restIntervals: [NSTimeInterval]
        ) -> [GeneralInterval] {
            
        precondition(workIntervals.count == restIntervals.count)
            
        var intervals: [GeneralInterval] = []
            
        for var i = 0; i < workIntervals.count / 2; i++ {
            intervals.append(
                WorkInterval(
                    interval: workIntervals[i],
                    description: "work set \(i)"
                )
            )
            intervals.append(
                RestInterval(
                    interval: restIntervals[i],
                    description: "rest set \(i)"
                )
            )
        }
        return intervals
    }
    
}