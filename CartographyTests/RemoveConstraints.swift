//
//  RemoveConstraints.swift
//  Cartography
//
//  Created by Robert Böhnke on 06/10/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import XCTest

class RemoveConstraints: XCTestCase {
    var superview: View!
    var view: View!

    override func setUp() {
        superview = View(frame: CGRectMake(0, 0, 400, 400))

        view = View(frame: CGRectZero)
        superview.addSubview(view)

        layout(view) { view in
            view.height == 200
            view.width == 200
        }
    }

    func testReplace() {
        replaceConstraints(view) { view in
            view.height == 400
            view.width == 400
        }

        XCTAssertEqual(CGRectGetWidth(view.frame), 400, "It should update the constraints")
        XCTAssertEqual(CGRectGetHeight(view.frame), 400, "It should update the constraints")
    }

}
