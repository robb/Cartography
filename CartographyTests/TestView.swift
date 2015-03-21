//
//  TestView.swift
//  Cartography
//
//  Created by Robert Böhnke on 21/03/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

import Cartography

class TestView: View {
    #if os(OSX)
    override var flipped: Bool {
        return true
    }
    #endif
}
