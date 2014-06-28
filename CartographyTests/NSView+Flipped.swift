//
//  NSView+Flipped.swift
//  Cartography
//
//  Created by Robert Böhnke on 26/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import AppKit

// Flip NSViews to get the same layout behavior for iOS and Mac tests
extension NSView {
    func isFlipped() -> Bool {
        return true
    }
}
