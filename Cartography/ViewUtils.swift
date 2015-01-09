//
//  ViewUtils.swift
//  Cartography
//
//  Created by Garth Snyder on 11/23/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS) && TEST
    import UIKit
    typealias View = UIView
#elseif TEST
    import AppKit
    typealias View = NSView
#else
    import Foundation
#endif

func closestCommonAncestor(a: View, b: View?) -> View? {
    if let b = b {
        // Quick-check the most likely possibilities
        if a == b { return a }
        let (aSuper, bSuper) = (a.superview, b.superview)
        if a == bSuper { return a }
        if b == aSuper { return b }
        if aSuper == bSuper { return aSuper }
        
        // None of those; run the general algorithm
        var ancestorsOfA = NSSet(array: Array(ancestors(a)))
        for ancestor in ancestors(b) {
            if ancestorsOfA.containsObject(ancestor) {
                return ancestor
            }
        }
        return nil // No ancestors in common
    }
    return a // b is nil
}

func ancestors(v: View) -> SequenceOf<View> {
    return SequenceOf<View> { () -> GeneratorOf<View> in
        var view: View? = v
        return GeneratorOf {
            let current = view
            view = view?.superview
            return current
        }
    }
}
