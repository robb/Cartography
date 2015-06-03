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

    return reduce(rest, ([], first)) { (acc, current) -> Accumulator in
        var (constraints, previous) = acc

        return (constraints + [ combine(previous, current) ], current)
    }.0
}


/// Distributes multiple views horizontally.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// :param: amount The distance between the views.
/// :param: views  The views to distribute.
///
/// :returns: An array of `NSLayoutConstraint` instances.
///
public func distribute(by amount: CGFloat, horizontally first: LayoutProxy, rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return distribute(by: amount, horizontally: [first] + rest)
}


/// Distributes multiple views horizontally.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// :param: amount The distance between the views.
/// :param: views  The views to distribute.
///
/// :returns: An array of `NSLayoutConstraint` instances.
///

public func distribute(by amount: CGFloat, horizontally views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(views.first!, Array(views[1..<views.count])) { $0.trailing == $1.leading - amount }
}


/// Distributes multiple views horizontally from left to right.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// :param: amount The distance between the views.
/// :param: views  The views to distribute.
///
/// :returns: An array of `NSLayoutConstraint` instances.
///
public func distribute(by amount: CGFloat, leftToRight first: LayoutProxy, rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return distribute(by: amount, leftToRight: [first] + rest)
}


/// Distributes multiple views horizontally from left to right.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// :param: amount The distance between the views.
/// :param: views  The views to distribute.
///
/// :returns: An array of `NSLayoutConstraint` instances.
///
public func distribute(by amount: CGFloat, leftToRight views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(views.first!, Array(views[1..<views.count])) { $0.right == $1.left - amount  }
}


/// Distributes multiple views vertically.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// :param: amount The distance between the views.
/// :param: views  The views to distribute.
///
/// :returns: An array of `NSLayoutConstraint` instances.
///
public func distribute(by amount: CGFloat, vertically first: LayoutProxy, rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return distribute(by: amount, vertically: [first] + rest)
}


/// Distributes multiple views vertically.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// :param: amount The distance between the views.
/// :param: views  The views to distribute.
///
/// :returns: An array of `NSLayoutConstraint` instances.
///
public func distribute(by amount: CGFloat, vertically views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(views.first!, Array(views[1..<views.count])) { $0.bottom == $1.top - amount }
}
