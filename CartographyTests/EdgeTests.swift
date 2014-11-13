//
//  EdgeTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import XCTest

class EdgeTests: XCTestCase {
    var superview: View!
    var view: View!

    override func setUp() {
        superview = View(frame: CGRectMake(0, 0, 400, 400))

        view = View(frame: CGRectZero)
        superview.addSubview(view)

        constrain(view) { view in
            view.height == 200
            view.width == 200
        }
    }

    func testTop() {
        layout(view) { view in
            view.top == view.superview!.top + 100; return
        }

        XCTAssert(CGRectGetMinY(view.frame) == 100, "It should layout the top edge")
    }

    func testRight() {
        layout(view) { view in
            view.right == view.superview!.right - 100; return
        }

        XCTAssert(CGRectGetMaxX(view.frame) == 300, "It should layout the right edge")
    }

    func testBottom() {
        layout(view) { view in
            view.bottom == view.superview!.bottom - 100; return
        }

        XCTAssert(CGRectGetMaxY(view.frame) == 300, "It should layout the bottom edge")
    }

    func testLeft() {
        layout(view) { view in
            view.left == view.superview!.left + 100; return
        }

        XCTAssert(CGRectGetMinX(view.frame) == 100, "It should layout the left edge")
    }

    func testCenterX() {
        layout(view) { view in
            view.centerX == view.superview!.centerX; return
        }

        XCTAssert(CGRectGetMidX(view.frame) == 200, "It should layout the center x \'edge\'")
    }

    func testCenterY() {
        layout(view) { view in
            view.centerY == view.superview!.centerY; return
        }

        XCTAssert(CGRectGetMidY(view.frame) == 200, "It should layout the center y \'edge\'")
    }
}
