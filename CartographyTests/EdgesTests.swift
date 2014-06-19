//
//  EdgesTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 19/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import UIKit
import XCTest

class EdgesTests: XCTestCase {
    var superview: UIView!
    var view: UIView!

    override func setUp() {
        superview = UIView(frame: CGRectMake(0, 0, 400, 400))

        view = UIView(frame: CGRectZero)
        superview.addSubview(view)
    }

    func testEquality() {
        layout(view, superview) { view, superview in
            view.edges == superview.edges; return
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 400, 400), "It should layout the edges")
    }

    func testInequality() {
        layout(view, superview) { view, superview in
            view.edges >= superview.edges
            view.edges <= superview.edges
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 400, 400), "It should layout the edges")
    }
}
