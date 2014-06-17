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
    var view2: UIView!

    override func setUp() {
        superview = UIView(frame: CGRectMake(0, 0, 100, 100))

        view = UIView(frame: CGRectZero)
        superview.addSubview(view)

        view2 = UIView(frame: CGRectZero)
        superview.addSubview(view2)
    }

    func testConstantEquality() {
        layout(view) { view in
            view.width == 200
            200 == view.height
        }

        XCTAssertEqual(view.frame.size, CGSizeMake(200, 200), "should layout stuff")
    }

    func testAttributeEquality() {
        layout(view) { view in
            view.width == 200
            view.width == view.height
        }

        XCTAssertEqual(view.frame.size, CGSizeMake(200, 200), "should layout stuff")
    }

    func testInequalities() {
        layout(view) { view in
            200 <= view.width; view.width <= 300
            view.height >= view.width
        }

        XCTAssertEqual(view.frame.size, CGSizeMake(200, 200), "should layout stuff")
    }

    func testAddition() {
        layout(view) { view in
            view.height == (50 + view.width + 100)
            view.width == 200
        }

        XCTAssertEqual(view.frame.size, CGSizeMake(200, 350), "should layout stuff")
    }

    func testMultiplication() {
        layout(view) { view in
            view.height == 2 * view.width
            view.width == 200
        }

        XCTAssertEqual(view.frame.size, CGSizeMake(200, 400), "should layout stuff")
    }

    func testPrecedence() {
        layout(view) { view in
            view.height == 2 * view.width + 50
            view.width == 200
        }

        XCTAssertEqual(view.frame.size, CGSizeMake(200, 450), "should layout stuff")
    }

    func testParenthesis() {
        layout(view) { view in
            view.height == 2 * (view.width + 50) + 5
            view.width == 200
        }

        XCTAssertEqual(view.frame.size, CGSizeMake(200, 505), "should layout stuff")
    }

    func testMultipleViews() {
        layout(view, view2) { view, view2 in
            2 * view2.height == view.height
            view.width == ((view2.width + 200) + 100) - 100

            view2.width  == 200
            view2.height == 200
        }

        XCTAssertEqual(view.frame.size, CGSizeMake(400, 400), "should layout stuff")
    }
}
