//
//  UpdateTests.swift
//  CartographyTests
//
//  Created by Suyeol Jeon on 09/01/15.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import XCTest

class UpdateTests: XCTestCase {
    var superview: View!
    var view1: View!
    var view2: View!

    override func setUp() {
        superview = View(frame: CGRectMake(0, 0, 400, 400))

        view1 = View(frame: CGRectMake(0, 0, 400, 400))
        superview.addSubview(view1)

        view2 = View(frame: CGRectMake(0, 0, 150, 200))
        superview.addSubview(view2)
    }

    func testUpdate1() {
        layout(view1) { view1 in
            view1.width  == 100
            view1.height == 100
        }

        layout(view1, view2) { (view1, view2) in
            view1.width  == view2.width  + 200
            view1.height == view2.height + 200
        }

        XCTAssert(CGRectGetWidth(view1.frame) == CGRectGetWidth(view2.frame) + 200, "It should update existing constraint")
        XCTAssert(CGRectGetHeight(view1.frame) == CGRectGetHeight(view2.frame) + 200, "It should update existing constraint")
    }

    func testUpdate2() {
        layout(view1, view2) { (view1, view2) in
            view1.width  == view2.width  + 200
            view1.height == view2.height + 200
        }

        layout(view1) { view1 in
            view1.width  == 100
            view1.height == 100
        }

        XCTAssert(CGRectGetWidth(view1.frame) == 100, "It should update existing constraint")
        XCTAssert(CGRectGetHeight(view1.frame) == 100, "It should update existing constraint")
    }
}
