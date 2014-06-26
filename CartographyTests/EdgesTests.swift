//
//  EdgesTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 19/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import XCTest

class EdgesTests: XCTestCase {
    var superview: View!
    var view: View!

    override func setUp() {
        superview = View(frame: CGRectMake(0, 0, 400, 400))

        view = View(frame: CGRectZero)
        superview.addSubview(view)
    }

    func testEquality() {
        layout(view) { view in
            view.edges == view.superview!.edges; return
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 400, 400), "It should layout the edges")
    }

    func testInequality() {
        layout(view) { view in
            view.edges >= view.superview!.edges
            view.edges <= view.superview!.edges
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 400, 400), "It should layout the edges")
    }

    func testInsetsAll() {
        layout(view) { view in
            view.edges == inset(view.superview!.edges, 20); return
        }

        XCTAssertEqual(view.frame, CGRectMake(20, 20, 360, 360), "It should layout the edges")
    }

    func testInsetsHorizontalVertical() {
        layout(view) { view in
            view.edges == inset(view.superview!.edges, 20, 30); return
        }

        XCTAssertEqual(view.frame, CGRectMake(20, 30, 360, 340), "It should layout the edges")
    }

    func testInsetsIndividual() {
        layout(view) { view in
            view.edges == inset(view.superview!.edges, 10, 20, 30, 40); return
        }

        XCTAssertEqual(view.frame, CGRectMake(20, 10, 340, 360), "It should layout the edges")
    }
}
