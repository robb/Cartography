//
//  MemoryLeakTests.swift
//  Cartography
//
//  Created by Robert Böhnke on 03/04/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

import Cartography
import XCTest

class MemoryLeakTests: XCTestCase {
    func testMemoryLeaks() {
        weak var weak_superview: View? = .None
        weak var weak_viewA: View? = .None
        weak var weak_viewB: View? = .None

        autoreleasepool {
            let superview = View(frame: CGRectMake(0, 0, 400, 400))

            let viewA: View = View(frame: CGRectMake(0, 0, 200, 200))
            superview.addSubview(viewA)

            let viewB: View = View(frame: CGRectMake(0, 0, 200, 200))
            superview.addSubview(viewB)

            weak_superview = superview
            weak_viewA = viewA
            weak_viewB = viewB

            layout(viewA, viewB) { viewA, viewB in
                viewA.top    == viewB.top
                viewB.bottom == viewA.bottom
            }
        }

        XCTAssert(weak_superview == .None)
        XCTAssert(weak_viewA == .None)
        XCTAssert(weak_viewB == .None)
    }
}
