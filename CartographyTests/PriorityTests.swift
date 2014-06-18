//
//  PriorityTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import UIKit
import XCTest

class PriorityTests: XCTestCase {
    var superview: UIView!
    var view1: UIView!

    override func setUp() {
        superview = UIView(frame: CGRectMake(0, 0, 100, 100))

        view1 = UIView(frame: CGRectZero)
        superview.addSubview(view1)
    }

    func testPriority() {
        var width: NSLayoutConstraint?

        layout(view1) { view in
            width = (view.width == 200 ~ 100)
        }

        XCTAssertEqual(width!.priority, 100, "should set priority")
    }
}
