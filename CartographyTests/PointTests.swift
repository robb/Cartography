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
        superview = TestView(frame: CGRectMake(0, 0, 400, 400))

        view = TestView(frame: CGRectZero)
        superview.addSubview(view)

        constrain(view) { view in
            view.width  == 200
            view.height == 200
        }
    }

    func testPoint() {
        layout(view) { view in
            view.center == view.superview!.center
        }

        XCTAssertEqual(view.frame, CGRectMake(100, 100, 200, 200), "should layout stuff")
    }

    #if os(iOS)
    func testCenterWithinMargins() {
        view.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)

        layout(view) { view in
            view.centerWithinMargins == view.superview!.center; return
        }

        XCTAssertEqual(view.frame, CGRectMake(110, 110, 200, 200), "should layout stuff")
    }
    #endif
}
