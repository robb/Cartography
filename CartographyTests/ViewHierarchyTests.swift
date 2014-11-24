//
//  ViewHierarchyTests.swift
//  Cartography
//
//  Created by Garth Snyder on 11/23/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import XCTest
import Cartography

class ViewHierarchyTests: XCTestCase {
    
    // Test cases:
    //   Nil second view
    //   Same view twice
    //   No common ancestor
    //   One view is the superview of the other
    //   One view is grandparent of the other
    //   Common parent view (shared superview)
    //   Common grandparent view
    //   Ancestor is grandparent of one view, parent of other
    
    var viewA, viewAParent, viewAGrandparent: View!
    var viewB, viewBParent, viewBGrandparent: View!
    
    override func setUp() {
        (viewA, viewAParent, viewAGrandparent) = (View(), View(), View())
        (viewB, viewBParent, viewBGrandparent) = (View(), View(), View())
        viewAParent.addSubview(viewA)
        viewAGrandparent.addSubview(viewAParent)
        viewBParent.addSubview(viewB)
        viewBGrandparent.addSubview(viewBParent)
    }
    
    func testBothWays(a: View, _ b: View) -> View? {
        let resultOne = closestCommonAncestor(a, b)
        let resultTwo = closestCommonAncestor(b, a)
        return resultOne == resultTwo ? resultOne : nil
    }
    
    func testNilView() {
        XCTAssert(closestCommonAncestor(viewA, nil) == viewA, "It should ignore nil view when determining common ancestor")
    }

    func testNoCommonAncestor() {
        XCTAssert(testBothWays(viewA, viewB) == nil, "It should detect absence of a common ancestor")
    }

    func testSameViewTwice() {
        XCTAssert(closestCommonAncestor(viewA, viewA) == viewA, "It should report a view as its closest common ancestor")
    }

    func testParent() {
        XCTAssert(testBothWays(viewA, viewAParent) == viewAParent, "It should handle a view and its parent")
    }

    func testGrandparent() {
        XCTAssert(testBothWays(viewA, viewAGrandparent) == viewAGrandparent, "It should handle a view and its grandparent")
    }
    
    func testSharedSuperview() {
        viewB.removeFromSuperview()
        viewAParent.addSubview(viewB)
        XCTAssert(testBothWays(viewA, viewB) == viewAParent, "It should handle two views with the same superview")
    }
    
    func testSharedGrandparent() {
        viewBParent.removeFromSuperview()
        viewAGrandparent.addSubview(viewBParent)
        XCTAssert(testBothWays(viewA, viewB) == viewAGrandparent, "It should handle two views with a shared grandparent")
    }
    
    func testMixedScenario() {
        viewBParent.removeFromSuperview()
        viewAParent.addSubview(viewBParent)
        XCTAssert(testBothWays(viewA, viewB) == viewAParent, "It should handle two views with a more complex configuration")
    }
}
