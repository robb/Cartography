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

/// Distributes multiple elements horizontally.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the elements.
/// - parameter elements:  An array of elements to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///

@discardableResult public func distribute(by amount: CGFloat = 0.0, horizontally elements: [SupportsHorizontalDistributionLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(elements) {
        let cast1 = $0 as! SupportsHorizontalDistributionLayoutProxy
        let cast2 = $1 as! SupportsHorizontalDistributionLayoutProxy
        return cast1.trailing == cast2.leading - amount
    }
}

/// Distributes multiple elements horizontally.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the elements.
/// - parameter elements:  The elements to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func distribute(by amount: CGFloat = 0.0, horizontally first: SupportsHorizontalDistributionLayoutProxy, _ rest: SupportsHorizontalDistributionLayoutProxy...) -> [NSLayoutConstraint] {
    return distribute(by: amount, horizontally: [first] + rest)
}

public typealias SupportsLeftToRightDistributionLayoutProxy = SupportsLeftLayoutProxy & SupportsRightLayoutProxy

/// Distributes multiple elements horizontally from left to right.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the elements.
/// - parameter elements:  An array of elements to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func distribute(by amount: CGFloat = 0.0, leftToRight elements: [SupportsLeftToRightDistributionLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(elements) {
        let cast1 = $0 as! SupportsLeftToRightDistributionLayoutProxy
        let cast2 = $1 as! SupportsLeftToRightDistributionLayoutProxy
        return cast1.right == cast2.left - amount
    }
}

/// Distributes multiple elements horizontally from left to right.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the elements.
/// - parameter elements:  The elements to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func distribute(by amount: CGFloat = 0.0, leftToRight first: SupportsLeftToRightDistributionLayoutProxy, _ rest: SupportsLeftToRightDistributionLayoutProxy...) -> [NSLayoutConstraint] {
    return distribute(by: amount, leftToRight: [first] + rest)
}

public typealias SupportsVerticalDistributionLayoutProxy = SupportsTopLayoutProxy & SupportsBottomLayoutProxy

/// Distributes multiple elements vertically.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the elements.
/// - parameter elements:  An array of elements to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func distribute(by amount: CGFloat = 0.0, vertically elements: [SupportsVerticalDistributionLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(elements) {
        let cast1 = $0 as! SupportsVerticalDistributionLayoutProxy
        let cast2 = $1 as! SupportsVerticalDistributionLayoutProxy
        return cast1.bottom == cast2.top - amount
    }
}

/// Distributes multiple elements vertically.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the elements.
/// - parameter elements:  The elements to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func distribute(by amount: CGFloat = 0.0, vertically first: SupportsVerticalDistributionLayoutProxy, _ rest: SupportsVerticalDistributionLayoutProxy...) -> [NSLayoutConstraint] {
    return distribute(by: amount, vertically: [first] + rest)
}
