//
//  DimensionTests.swift
//  AutolayoutDSLTests
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import AutolayoutDSL
import UIKit
import XCTest

class AutolayoutDSLTests: XCTestCase {
    var superview: UIView!
    var view: UIView!

    override func setUp() {
        superview = UIView(frame: CGRectMake(0, 0, 100, 100))
        view = UIView(frame: CGRectZero)

        superview.addSubview(view)
    }

    func testConstantEquality() {
        view.defineLayout { view in
            view.width == 200
            200 == view.height
        }

        XCTAssertEqual(view.frame.size, CGSizeMake(200, 200), "should layout stuff")
    }

    func testAttributeEquality() {
        view.defineLayout { view in
            view.width == 200
            view.width == view.height
        }

        XCTAssertEqual(view.frame.size, CGSizeMake(200, 200), "should layout stuff")
    }

    func testInequalities() {
        view.defineLayout { view in
            200 <= view.width; view.width <= 300
            300 >= view.height; view.height >= 200
        }

        XCTAssertEqual(view.frame.size, CGSizeMake(200, 200), "should layout stuff")
    }
}
