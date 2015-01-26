//
//  ConstraintGroupTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 26/01/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

import Cartography
import XCTest

class ConstraintGroupTests: XCTestCase {
    var superview: View!
    var view: View!

    override func setUp() {
        superview = View(frame: CGRectMake(0, 0, 400, 400))

        view = View(frame: CGRectZero)
        superview.addSubview(view)
    }

    func testActivation() {
        let a = constrain(view) { view in
            view.width  == 100
            view.height == 100
        }

        a.active = false

        let b = layout(view) { view in
            view.width  == 200
            view.height == 200
        }

        XCTAssertEqual(CGRectGetWidth(view.frame), CGFloat(200), "It should layout the height")
        XCTAssertEqual(CGRectGetHeight(view.frame), CGFloat(200), "It should layout the height")

        b.active = false
        a.active = true

        XCTAssert(CGRectGetWidth(view.frame) == 100, "It should layout the height")
        XCTAssert(CGRectGetHeight(view.frame) == 100, "It should layout the height")
    }
}
