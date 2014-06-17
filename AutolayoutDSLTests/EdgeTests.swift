//
//  EdgeTests.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import AutolayoutDSL
import UIKit
import XCTest

class EdgeTests: XCTestCase {
    var superview: UIView!
    var view1: UIView!
    var view2: UIView!

    override func setUp() {
        superview = UIView(frame: CGRectMake(0, 0, 100, 100))

        view1 = UIView(frame: CGRectZero)
        superview.addSubview(view1)

        view2 = UIView(frame: CGRectZero)
        superview.addSubview(view2)

        layout(view1, view2) { view1, view2 in
            view1.height == view2.height
            view1.width == view2.width

            view2.width  == 200
            view2.height == 200
        }
    }

    func testAlign() {
        layout(superview, view1, view2) { superview, view1, view2 in
            view1.top  == superview.top + 20
            view2.top  == superview.top + 20

            view1.left == superview.left + 20
            view2.left == view1.right + 20
        }

        XCTAssertEqual(view1.frame, CGRectMake( 20, 20, 200, 200), "should layout stuff")
        XCTAssertEqual(view2.frame, CGRectMake(240, 20, 200, 200), "should layout stuff")
    }
}
