//
//  DimensionTests.swift
//  CartographyTests
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import XCTest

class DimensionTests: XCTestCase {
    var superview: View!
    var view: View!

    override func setUp() {
        superview = TestView(frame: CGRectMake(0, 0, 400, 400))

        view = TestView(frame: CGRectZero)
        superview.addSubview(view)
    }

    func testWidth() {
        layout(view) { view in
            view.width == view.superview!.width - 200
        }

        XCTAssert(CGRectGetWidth(view.frame) == 200, "It should layout the width")
    }

    func testWidthConstants() {
        layout(view) { view in
            view.width == 200
        }

        XCTAssert(CGRectGetWidth(view.frame) == 200, "It should layout the width")
    }

    func testHeight() {
        layout(view) { view in
            view.height == view.superview!.height - 200
        }

        XCTAssert(CGRectGetHeight(view.frame) == 200, "It should layout the height")
    }

    func testHeightConstants() {
        layout(view) { view in
            view.height == 200
        }

        XCTAssert(CGRectGetHeight(view.frame) == 200, "It should layout the height")
    }
}
