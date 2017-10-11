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

@discardableResult private func reduce(_ elements: [LayoutProxy], combine: (LayoutProxy, LayoutProxy) -> NSLayoutConstraint) -> [NSLayoutConstraint] {
    if let first = elements.first {
        let rest = elements.dropFirst()
        
        return rest.reduce(([], first)) { (acc, current) -> ([NSLayoutConstraint], LayoutProxy) in
            let (constraints, previous) = acc
            
            return (constraints + [ combine(previous, current) ], current)
        }.0
    } else {
        return []
    }
}

public typealias SupportsHorizontalDistributionLayoutProxy = SupportsLeadingLayoutProxy & SupportsTrailingLayoutProxy

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

@discardableResult public func distribute(by amount: CGFloat = 0.0, horizontally views: [SupportsHorizontalDistributionLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(views) {
        let cast1 = $0 as! SupportsHorizontalDistributionLayoutProxy
        let cast2 = $1 as! SupportsHorizontalDistributionLayoutProxy
        return cast1.trailing == cast2.leading - amount
    }
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
@discardableResult public func distribute(by amount: CGFloat = 0.0, horizontally first: SupportsHorizontalDistributionLayoutProxy, _ rest: SupportsHorizontalDistributionLayoutProxy...) -> [NSLayoutConstraint] {
    return distribute(by: amount, horizontally: [first] + rest)
}

public typealias SupportsLeftToRightDistributionLayoutProxy = SupportsLeftLayoutProxy & SupportsRightLayoutProxy

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
@discardableResult public func distribute(by amount: CGFloat = 0.0, leftToRight views: [SupportsLeftToRightDistributionLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(views) {
        let cast1 = $0 as! SupportsLeftToRightDistributionLayoutProxy
        let cast2 = $1 as! SupportsLeftToRightDistributionLayoutProxy
        return cast1.right == cast2.left - amount
    }
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
@discardableResult public func distribute(by amount: CGFloat = 0.0, leftToRight first: SupportsLeftToRightDistributionLayoutProxy, _ rest: SupportsLeftToRightDistributionLayoutProxy...) -> [NSLayoutConstraint] {
    return distribute(by: amount, leftToRight: [first] + rest)
}

public typealias SupportsVerticalDistributionLayoutProxy = SupportsTopLayoutProxy & SupportsBottomLayoutProxy

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
@discardableResult public func distribute(by amount: CGFloat = 0.0, vertically views: [SupportsVerticalDistributionLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(views) {
        let cast1 = $0 as! SupportsVerticalDistributionLayoutProxy
        let cast2 = $1 as! SupportsVerticalDistributionLayoutProxy
        return cast1.bottom == cast2.top - amount
    }
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
@discardableResult public func distribute(by amount: CGFloat = 0.0, vertically first: SupportsVerticalDistributionLayoutProxy, _ rest: SupportsVerticalDistributionLayoutProxy...) -> [NSLayoutConstraint] {
    return distribute(by: amount, vertically: [first] + rest)
}
