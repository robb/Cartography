//
//  TypesTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 03/02/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

import Cartography
import XCTest

class TypesTests: XCTestCase {
    var superview: View!
    var view: View!

    override func setUp() {
        superview = View(frame: CGRectMake(0, 0, 400, 400))

        view = View(frame: CGRectZero)
        superview.addSubview(view)
    }

    func testFloat() {
        let width: Float = 200
        let height: Float = 300

        layout(view) { view in
            view.width == width
            view.height == height
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 200, 300), "It should layout the size")
    }

    func testDouble() {
        let width: Double = 200
        let height: Double = 300

        layout(view) { view in
            view.width == width
            view.height == height
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 200, 300), "It should layout the size")
    }

    func testCGFloat() {
        let width: CGFloat = 200
        let height: CGFloat = 300

        layout(view) { view in
            view.width == width
            view.height == height
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 200, 300), "It should layout the size")
    }
}
