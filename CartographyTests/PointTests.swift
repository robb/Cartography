//
//  PointTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import UIKit
import XCTest

class PointTests: XCTestCase {
    var superview: UIView!
    var view: UIView!

    override func setUp() {
        superview = UIView(frame: CGRectMake(0, 0, 400, 400))

        view = UIView(frame: CGRectZero)
        superview.addSubview(view)

        layout(view) { view in
            view.width  == 200
            view.height == 200
        }
    }

    func testPoint() {
        layout(view, superview) { view, superview in
            view.center == superview.center; return
        }

        XCTAssertEqual(view.frame, CGRectMake(100, 100, 200, 200), "should layout stuff")
    }
}
