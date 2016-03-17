//
//  Program.swift
//  Tabata
//
//  Created by Lamb, Christopher Charles on 3/11/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import Foundation

public protocol Program {
    typealias ProgramType
    init( name: String, description: String, program: [ProgramType])
    var name: String { get }
    var description: String { get }
    var program: [ProgramType] { get }
}