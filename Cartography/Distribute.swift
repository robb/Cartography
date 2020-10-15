//
//  Distribute.swift
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

typealias Accumulator = ([NSLayoutConstraint], LayoutProxy)

private func reduce(first: LayoutProxy, rest: [LayoutProxy], combine: (LayoutProxy, LayoutProxy) -> NSLayoutConstraint) -> [NSLayoutConstraint] {
    rest.last?.view.car_translatesAutoresizingMaskIntoConstraints = false

    return rest.reduce(([], first)) { (acc, current) -> Accumulator in
        let (constraints, previous) = acc

        return (constraints + [ combine(previous, current) ], current)
    }.0
}

/// Distributes multiple views horizontally.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the views.
/// - parameter views:  The views to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
public func distribute(by amount: CGFloat, horizontally first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return reduce(first, rest: rest) { $0.trailing == $1.leading - amount }
}

/// Distributes multiple views horizontally from left to right.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the views.
/// - parameter views:  The views to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
public func distribute(by amount: CGFloat, leftToRight first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return reduce(first, rest: rest) { $0.right == $1.left - amount  }
}

/// Distributes multiple views vertically.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the views.
/// - parameter views:  The views to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
public func distribute(by amount: CGFloat, vertically first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return reduce(first, rest: rest) { $0.bottom == $1.top - amount }
}
