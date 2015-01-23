//
//  ReplacingConstraintsTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 22/01/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

import Cartography
import XCTest

class ReplacingConstraintsTests: XCTestCase {
    var superview: View!
    var view1: View!
    var view2: View!

    override func setUp() {
        superview = View(frame: CGRectMake(0, 0, 400, 400))

        view1 = View(frame: CGRectZero)
        superview.addSubview(view1)

        view2 = View(frame: CGRectZero)
        superview.addSubview(view2)
    }

    func testReplacingConstraints() {
        layout(view1, view2) { view1, view2 in
            view1.top    == view1.superview!.top   + 10
            view1.left   == view1.superview!.left  + 10
            view1.right  == view1.superview!.right - 10
            view1.height == 200

            view2.centerX == view1.centerX
            view2.top     == view1.bottom
            view2.width   == view1.width
        }

        let group = layout(view2) { view2 in
            view2.height == 100; return
        }

        XCTAssertEqual(view2.frame, CGRectMake(10, 210, 380, 100), "should layout stuff")

        layout(view2, replace: group) { view2 in
            view2.bottom >= view2.superview!.bottom; return
        }

        XCTAssertEqual(view2.frame, CGRectMake(10, 210, 380, 190), "should layout stuff")
    }
}
