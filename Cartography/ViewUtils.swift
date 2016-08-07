//
//  ViewUtils.swift
//  Cartography
//
//  Created by Garth Snyder on 11/23/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

internal func closestCommonAncestor(_ a: View, b: View) -> View? {
    let (aSuper, bSuper) = (a.superview, b.superview)

    if a === b { return a }

    if a === bSuper { return a }

    if b === aSuper { return b }

    if aSuper === bSuper { return aSuper }

    let ancestorsOfA = Set(ancestors(a))

    for ancestor in ancestors(b) {
        if ancestorsOfA.contains(ancestor) {
            return ancestor
        }
    }

    return .none
}

private func ancestors(_ v: View) -> AnySequence<View> {
    return AnySequence { () -> AnyIterator<View> in
        var view: View? = v
        return AnyIterator {
            let current = view
            view = view?.superview
            return current
        }
    }
}
