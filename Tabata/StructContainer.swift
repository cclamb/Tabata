//
//  Container.swift
//  Tabata
//
//  Created by Lamb, Christopher Charles on 3/17/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import Foundation

class StructContainer<T> {
    private var _contained: T
    init(contained: T) {
        _contained = contained
    }
    var contained: T {
        get {
            return _contained
        }
    }
}