//
//  EdgeTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import UIKit
import XCTest

class EdgeTests: XCTestCase {
    var superview: UIView!
    var view: UIView!

    override func setUp() {
        superview = UIView(frame: CGRectMake(0, 0, 400, 400))

        view = UIView(frame: CGRectZero)
        superview.addSubview(view)

        layout(view) { view in
            view.height == 200
            view.width == 200
        }
    }

    func testTop() {
        layout(view, superview) { view, superview in
            view.top == superview.top + 100; return
        }

        XCTAssertEqual(CGRectGetMinY(view.frame), 100, "It should layout the top edge")
    }

    func testRight() {
        layout(view, superview) { view, superview in
            view.right == superview.right - 100; return
        }

        XCTAssertEqual(CGRectGetMaxX(view.frame), 300, "It should layout the right edge")
    }

    func testBottom() {
        layout(view, superview) { view, superview in
            view.bottom == superview.bottom - 100; return
        }

        XCTAssertEqual(CGRectGetMaxY(view.frame), 300, "It should layout the bottom edge")
    }

    func testLeft() {
        layout(view, superview) { view, superview in
            view.left == superview.left + 100; return
        }

        XCTAssertEqual(CGRectGetMinX(view.frame), 100, "It should layout the left edge")
    }

    func testCenterX() {
        layout(view, superview) { view, superview in
            view.centerX == superview.centerX; return
        }

        XCTAssertEqual(CGRectGetMidX(view.frame), 200, "It should layout the center x \'edge\'")
    }

    func testCenterY() {
        layout(view, superview) { view, superview in
            view.centerY == superview.centerY; return
        }

        XCTAssertEqual(CGRectGetMidY(view.frame), 200, "It should layout the center y \'edge\'")
    }
}
