//
//  Extensions.swift
//  Cartography
//
//  Created by Robert Böhnke on 22/01/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

internal extension Dictionary {
    init(_ pairs: [Element]) {
        self.init()

        for (key, value) in pairs {
            self[key] = value
        }
    }
}
