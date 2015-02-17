//
//  Align.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/02/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

private typealias Accumulator = (previous: LayoutProxy, constraints: [NSLayoutConstraint])

private func makeEqual<P: RelativeEquality>(attribute: LayoutProxy -> P, first: LayoutProxy, rest: [LayoutProxy]) -> [NSLayoutConstraint] {
    let result = reduce(rest, (first, [])) { (var acc: Accumulator, current) in
        acc.constraints += [ attribute(current) == attribute(acc.previous) ]
        acc.previous = current

        return acc
    }

    return result.1
}

public func align(top first: LayoutProxy, rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.top }, first, rest)
}

public func align(right first: LayoutProxy, rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.right }, first, rest)
}

public func align(bottom first: LayoutProxy, rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.bottom }, first, rest)
}

public func align(left first: LayoutProxy, rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.left }, first, rest)
}

public func align(leading first: LayoutProxy, rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.leading }, first, rest)
}

public func align(trailing first: LayoutProxy, rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.trailing }, first, rest)
}

public func align(centerX first: LayoutProxy, rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.centerX }, first, rest)
}

public func align(centerY first: LayoutProxy, rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.centerY }, first, rest)
}

public func align(baseline first: LayoutProxy, rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.baseline }, first, rest)
}
