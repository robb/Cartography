//
//  DimensionTests.swift
//  CartographyTests
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import UIKit
import XCTest

class CartographyTests: XCTestCase {
    var superview: UIView!
    var view: UIView!

    override func setUp() {
        superview = UIView(frame: CGRectMake(0, 0, 400, 400))

        view = UIView(frame: CGRectZero)
        superview.addSubview(view)
    }

    func testWidth() {
        layout(view, superview) { view, superview in
            view.width == superview.width - 200; return
        }

        XCTAssertEqual(CGRectGetWidth(view.frame), 200, "It should layout the width")
    }

    func testWidthConstants() {
        layout(view, superview) { view, superview in
            view.width == 200; return
        }

        XCTAssertEqual(CGRectGetWidth(view.frame), 200, "It should layout the width")
    }

    func testHeight() {
        layout(view, superview) { view, superview in
            view.height == superview.height - 200; return
        }

        XCTAssertEqual(CGRectGetHeight(view.frame), 200, "It should layout the height")
    }

    func testHeightConstants() {
        layout(view, superview) { view, superview in
            view.height == 200; return
        }

        XCTAssertEqual(CGRectGetHeight(view.frame), 200, "It should layout the height")
    }
}
