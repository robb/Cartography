//
//  PointTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import XCTest

class PointTests: XCTestCase {
    var superview: View!
    var view: View!

    override func setUp() {
        superview = View(frame: CGRectMake(0, 0, 400, 400))

        view = View(frame: CGRectZero)
        superview.addSubview(view)

        constrain(view) { view in
            view.width  == 200
            view.height == 200
        }
    }

    func testPoint() {
        layout(view) { view in
            view.center == view.superview!.center; return
        }

        XCTAssertEqual(view.frame, CGRectMake(100, 100, 200, 200), "should layout stuff")
    }
}
