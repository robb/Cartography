//
//  SizeTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import UIKit
import XCTest

class SizeTests: XCTestCase {
    var superview: UIView!
    var view: UIView!

    override func setUp() {
        superview = UIView(frame: CGRectMake(0, 0, 400, 400))

        view = UIView(frame: CGRectZero)
        superview.addSubview(view)
    }

    func testEquality() {
        layout(view, superview) { view, superview in
            view.size == superview.size; return
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 400, 400), "It should layout the size")
    }

    func testInequality() {
        layout(view, superview) { view, superview in
            view.size >= superview.size
            view.size <= superview.size
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 400, 400), "It should layout the size")
    }

    func testMultiplication() {
        layout(view, superview) { view, superview in
            view.size == superview.size * 1.5; return
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 600, 600), "It should affect width and height")
    }

    func testDivision() {
        layout(view, superview) { view, superview in
            view.size == superview.size / 2; return
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 200, 200), "It should affect width and height")
    }
}
