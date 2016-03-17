//
//  TimerProgram.swift
//  Tabata
//
//  Created by Lamb, Christopher Charles on 3/11/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import Foundation

public struct TimerProgram<I: Interval>: Program {
    
    var _name:String
    var _description: String
    var _program: [I]
    
    public init(name: String, description: String, program: [I]) {
        self._name = name
        self._description = description
        self._program = program
    }
    
    public var name: String {
        get {
            return _name
        }
    }
    
    public var description: String {
        get {
            return _description
        }
    }
    
    public var program: [I] {
        get {
            return _program
        }
    }
}