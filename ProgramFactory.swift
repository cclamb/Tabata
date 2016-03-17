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
    
    private static var DefaultInterval = 12
    
    public static var Tabata = ProgramFactory.buildTabata(DefaultInterval)
    
    public static var EmptyProgram = ProgramFactory.buildEmptyProgram()
    
    private static func buildTabata(intervalCount: Int) -> GeneralProgram {
        
        var intervals: [GeneralInterval] = []
        
        for var i = 0; i < intervalCount / 2; i++ {
            intervals.append(
                WorkInterval(interval: 20 * 100, description: "work set \(i)")
            )
            intervals.append(
                RestInterval(interval: 20 * 100, description: "rest set \(i)")
            )
        }

        return GeneralProgram(
            name: "\(intervalCount) Round Tabata",
            description: "This is a \(intervalCount) round Tabata program.",
            program: intervals
        )
    }
    
    private static func buildEmptyProgram() -> GeneralProgram {
        return GeneralProgram(
            name: "New Program",
            description: "A new program - please update me! I'm empty!",
            program: []
        )
    }
    
    
}