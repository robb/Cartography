//
//  SizeTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Cartography
import UIKit
import XCTest

class SizeTests: XCTestCase {
    var superview: UIView!
    var view: UIView!

    override func setUp() {
        superview = UIView(frame: CGRectMake(0, 0, 400, 400))

        view = UIView(frame: CGRectZero)
        superview.addSubview(view)

        layout(view) { view in
            view.width  >= 200
            view.height >= 200
        }
    }

    func testSize() {
        layout(view, superview) { view, superview in
            view.size == superview.size; return
        }

        XCTAssertEqual(view.frame, CGRectMake(0, 0, 400, 400), "should layout stuff")
    }
}
