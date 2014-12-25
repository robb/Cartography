//
//  OperatorTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import XCTest

class OperatorTests: XCTestCase {
    var superview: View!
    var view: View!

    override func setUp() {
        superview = View(frame: CGRectMake(0, 0, 200, 200))

        view = View(frame: CGRectZero)
        superview.addSubview(view)
    }

    func testAddition() {
        var constraint: NSLayoutConstraint!

        layout(view) { view in
            constraint = view.width == view.superview!.width + 100
        }

        XCTAssert(constraint.constant == 100, "It should set the constant")
    }

    func testSubtraction() {
        var constraint: NSLayoutConstraint!

        layout(view) { view in
            constraint = view.width == view.superview!.width - 100
        }

        XCTAssert(constraint.constant == -100, "It should set the constant")
    }

    func testMultiplication() {
        var constraint: NSLayoutConstraint!

        layout(view) { view in
            constraint = view.width == (view.superview!.width + 100) * 2 + 5
        }

        XCTAssert(constraint.multiplier == 2, "It should set the constant")
        XCTAssert(constraint.constant == 205, "It should multiply the constant")
    }

    func testDivision() {
        var constraint: NSLayoutConstraint!

        layout(view) { view in
            constraint = view.width == (view.superview!.width + 100) / 2 + 5
        }

        XCTAssert(constraint.multiplier == 0.5, "It should set the constant")
        XCTAssert(constraint.constant == 55, "It should divide the constant")
    }

    func testDivision2() {
        var constraint: NSLayoutConstraint!

        layout(view) { view in
            constraint = view.width == view.superview!.width / 2
        }

        XCTAssert(constraint.multiplier == 0.5, "It should set the constant")
    }

    func testPriority() {
        var constraint: NSLayoutConstraint!

        layout(view) { view in
            constraint = (view.width == 200 ~ 100)
        }

        XCTAssert(constraint.priority == 100, "It should set the priority")
    }

    func testPriorities() {
        var constraints: [NSLayoutConstraint]!

        layout(view) { view in
            constraints = (view.size <= view.superview!.size ~ 100)
        }

        XCTAssert(constraints[0].priority == 100, "It should set the priority")
        XCTAssert(constraints[1].priority == 100, "It should set the priority")
    }
}
