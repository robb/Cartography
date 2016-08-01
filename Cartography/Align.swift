//
//  Align.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/02/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

private func makeEqual<P: RelativeEquality>(attribute: LayoutProxy -> P, first: LayoutProxy, rest: [LayoutProxy]) -> [NSLayoutConstraint] {
    return rest.reduce([]) { acc, current in
        current.view.car_translatesAutoresizingMaskIntoConstraints = false

        return acc + [ attribute(first) == attribute(current) ]
    }
}

private func makeEqual<P: RelativeEquality>(attribute: LayoutProxy -> P, views: [LayoutProxy]) -> [NSLayoutConstraint] {
    let (first, rest) = splitLayoutProxyArray(views)
    return rest.reduce([]) { acc, current in
        current.view.car_translatesAutoresizingMaskIntoConstraints = false
        
        return acc + [ attribute(first) == attribute(current) ]
    }
}

/// Aligns multiple views by their top edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
public func align(top first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.top }, first: first, rest: rest)
}

public func align(top views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual({ $0.top }, views: views)
}

/// Aligns multiple views by their right edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
public func align(right first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.right }, first: first, rest: rest)
}

public func align(right views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual({ $0.right }, views: views)
}

/// Aligns multiple views by their bottom edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
public func align(bottom first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.bottom }, first: first, rest: rest)
}

public func align(bottom views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual({ $0.bottom }, views: views)
}

/// Aligns multiple views by their left edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
public func align(left first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.left }, first: first, rest: rest)
}

public func align(left views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual({ $0.left }, views: views)
}

/// Aligns multiple views by their leading edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
public func align(leading first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.leading }, first: first, rest: rest)
}

public func align(leading views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual({ $0.leading }, views: views)
}

/// Aligns multiple vies by their trailing edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
public func align(trailing first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.trailing }, first: first, rest: rest)
}

public func align(trailing views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual({ $0.trailing }, views: views)
}

/// Aligns multiple views by their horizontal center.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
public func align(centerX first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.centerX }, first: first, rest: rest)
}

public func align(centerX views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual({ $0.centerX }, views: views)
}

/// Aligns multiple views by their vertical center.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
public func align(centerY first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.centerY }, first: first, rest: rest)
}

public func align(centerY views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual({ $0.centerY }, views: views)
}

/// Aligns multiple views by their baseline.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
public func align(baseline first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return makeEqual({ $0.baseline }, first: first, rest: rest)
}

public func align(baseline views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual({ $0.baseline }, views: views)
}
