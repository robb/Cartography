//
//  DistributeTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/02/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

import Cartography
import XCTest

class DistributeTests: XCTestCase {
    var superview: View!
    var viewA: View!
    var viewB: View!
    var viewC: View!

    override func setUp() {
        superview = View(frame: CGRectMake(0, 0, 400, 400))

        viewA = View(frame: CGRectZero)
        superview.addSubview(viewA)

        viewB = View(frame: CGRectZero)
        superview.addSubview(viewB)

        viewC = View(frame: CGRectZero)
        superview.addSubview(viewC)

        constrain(viewA, viewB, viewC) { viewA, viewB, viewC in
            viewA.width  == 100
            viewA.height == 100

            viewA.top  == viewA.superview!.top
            viewA.left == viewA.superview!.left

            viewA.size == viewB.size
            viewA.size == viewC.size
        }
    }

    func testDistributeHorizontally() {
        layout(viewA, viewB, viewC) { viewA, viewB, viewC in
            align(centerY: viewA, viewB, viewC)
            distribute(by: 10, horizontally: viewA, viewB, viewC)
        }

        XCTAssertEqual(viewA.frame, CGRect(x:   0, y: 0, width: 100, height: 100), "It should distribute the views")
        XCTAssertEqual(viewB.frame, CGRect(x: 110, y: 0, width: 100, height: 100), "It should distribute the views")
        XCTAssertEqual(viewC.frame, CGRect(x: 220, y: 0, width: 100, height: 100), "It should distribute the views")

        XCTAssertFalse(viewA.car_translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(viewB.car_translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(viewC.car_translatesAutoresizingMaskIntoConstraints)
    }

    func testDistributeLeftToRight() {
        layout(viewA, viewB, viewC) { viewA, viewB, viewC in
            align(centerY: viewA, viewB, viewC)
            distribute(by: 10, leftToRight: viewA, viewB, viewC)
        }

        XCTAssertEqual(viewA.frame, CGRect(x:   0, y: 0, width: 100, height: 100), "It should distribute the views")
        XCTAssertEqual(viewB.frame, CGRect(x: 110, y: 0, width: 100, height: 100), "It should distribute the views")
        XCTAssertEqual(viewC.frame, CGRect(x: 220, y: 0, width: 100, height: 100), "It should distribute the views")

        XCTAssertFalse(viewA.car_translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(viewB.car_translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(viewC.car_translatesAutoresizingMaskIntoConstraints)
    }

    func testDistributeVertically() {
        layout(viewA, viewB, viewC) { viewA, viewB, viewC in
            align(centerX: viewA, viewB, viewC)
            distribute(by: 10, vertically: viewA, viewB, viewC)
        }

        XCTAssertEqual(viewA.frame, CGRect(x: 0, y:   0, width: 100, height: 100), "It should distribute the views")
        XCTAssertEqual(viewB.frame, CGRect(x: 0, y: 110, width: 100, height: 100), "It should distribute the views")
        XCTAssertEqual(viewC.frame, CGRect(x: 0, y: 220, width: 100, height: 100), "It should distribute the views")

        XCTAssertFalse(viewA.car_translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(viewB.car_translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(viewC.car_translatesAutoresizingMaskIntoConstraints)
    }
}
