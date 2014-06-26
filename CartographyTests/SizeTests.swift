//
//  SizeTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import XCTest

class SizeTests: XCTestCase {
    var superview: View!
    var view: View!

    override func setUp() {
        superview = View(frame: CGRectMake(0, 0, 400, 400))

        view = View(frame: CGRectZero)
        superview.addSubview(view)
    }

    func testEquality() {
        layout(view) { view in
            view.size == view.superview!.size; return
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 400, 400), "It should layout the size")
    }

    func testInequality() {
        layout(view) { view in
            view.size >= view.superview!.size
            view.size <= view.superview!.size
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 400, 400), "It should layout the size")
    }

    func testMultiplication() {
        layout(view) { view in
            view.size == view.superview!.size * 1.5; return
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 600, 600), "It should affect width and height")
    }

    func testDivision() {
        layout(view) { view in
            view.size == view.superview!.size / 2; return
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 200, 200), "It should affect width and height")
    }
}
