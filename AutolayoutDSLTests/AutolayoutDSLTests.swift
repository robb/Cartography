//
//  AutolayoutDSLTests.swift
//  AutolayoutDSLTests
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import AutolayoutDSL
import UIKit
import XCTest

var superview: UIView?
var view: UIView?

class AutolayoutDSLTests: XCTestCase {
    override func setUp() {
        superview = UIView(frame: CGRectMake(0, 0, 100, 100))
        view = UIView(frame: CGRectZero)

        superview!.addSubview(view)
    }

    func testExample() {
        view!.width() == 200
        view!.height() == 200

        view!.layoutIfNeeded()

        XCTAssertEqual(view!.frame.size, CGSizeMake(200, 200), "should layout stuff")
    }
}
