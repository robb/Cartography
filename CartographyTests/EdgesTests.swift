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

    func testInsetsAll() {
        layout(view, superview) { view, superview in
            view.edges == inset(superview.edges, 20); return
        }

        XCTAssertEqual(view.frame, CGRectMake(20, 20, 360, 360), "It should layout the edges")
    }

    func testInsetsHorizontalVertical() {
        layout(view, superview) { view, superview in
            view.edges == inset(superview.edges, 20, 30); return
        }

        XCTAssertEqual(view.frame, CGRectMake(20, 30, 360, 340), "It should layout the edges")
    }

    func testInsetsIndividual() {
        layout(view, superview) { view, superview in
            view.edges == inset(superview.edges, 10, 20, 30, 40); return
        }

        XCTAssertEqual(view.frame, CGRectMake(20, 10, 340, 360), "It should layout the edges")
    }
}
