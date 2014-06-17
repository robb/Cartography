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
        layout(view1) { view in
            view.width == 200 ~ 100
        }

        let constraints: NSLayoutConstraint[] = view1.constraints() as NSLayoutConstraint[]

        XCTAssertEqual(constraints[0].priority, 100, "should set priority")
    }
}
