//
//  Extensions.swift
//  Cartography
//
//  Created by Robert Böhnke on 22/01/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

import Foundation

internal extension Dictionary {
    init (_ pairs: [Element]) {
        self.init()

        for (key, value) in pairs {
            self[key] = value
        }
    }
}
