//
//  DataManager.swift
//  Tabata
//
//  Created by Lamb, Christopher Charles on 4/16/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import Foundation
import Timer

public class DataManager {
    
    private static var _instance: DataManager?
    private static var _token: dispatch_once_t = 0
    
    public class var instance: DataManager {
        get {
            dispatch_once(&_token) {
                _instance = DataManager()
            }
            return _instance!
        }
    }
    
    public var selectedProgram: TimerProgram<GeneralInterval>?
}