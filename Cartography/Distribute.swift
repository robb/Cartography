//
//  Distribute.swift
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

typealias Accumulator = ([NSLayoutConstraint], LayoutProxy)

@discardableResult private func reduce(_ elements: [LayoutProxy], combine: (LayoutProxy, LayoutProxy) -> NSLayoutConstraint) -> [NSLayoutConstraint] {
    elements.last?.view.car_translatesAutoresizingMaskIntoConstraints = false
    
    if let first = elements.first {
        let rest = elements.dropFirst()
        
        return rest.reduce(([], first)) { (acc, current) -> Accumulator in
            let (constraints, previous) = acc
            
            return (constraints + [ combine(previous, current) ], current)
        }.0
    } else {
        return []
    }
}

/// Distributes multiple views horizontally.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the views.
/// - parameter views:  An array of views to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func distribute(by amount: CGFloat = 0.0, horizontally views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(views) { $0.trailing == $1.leading - amount }
}

/// Distributes multiple views horizontally from left to right.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the views.
/// - parameter views:  An array of views to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func distribute(by amount: CGFloat = 0.0, leftToRight views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(views) { $0.right == $1.left - amount }
}

/// Distributes multiple views vertically.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the views.
/// - parameter views:  An array of views to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func distribute(by amount: CGFloat = 0.0, vertically views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(views) { $0.bottom == $1.top - amount }
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
@discardableResult public func distribute(by amount: CGFloat = 0.0, horizontally first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return distribute(by: amount, horizontally: [first] + rest)
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
@discardableResult public func distribute(by amount: CGFloat = 0.0, leftToRight first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return distribute(by: amount, leftToRight: [first] + rest)
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
@discardableResult public func distribute(by amount: CGFloat = 0.0, vertically first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return distribute(by: amount, vertically: [first] + rest)
}
