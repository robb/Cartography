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

@discardableResult private func reduce<T: LayoutProxy>(_ elements: [T], combine: (T, T) -> NSLayoutConstraint) -> [NSLayoutConstraint] {
    if let first = elements.first {
        let rest = elements.dropFirst()
        
        return rest.reduce(([], first)) { (acc, current) -> ([NSLayoutConstraint], T) in
            let (constraints, previous) = acc
            
            return (constraints + [ combine(previous, current) ], current)
        }.0
    } else {
        return []
    }
}

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

@discardableResult public func distribute(by amount: CGFloat = 0.0, horizontally elements: [SupportsLeadingLayoutProxy & SupportsTrailingLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(elements.map(AnyHorizontalDistributionLayoutProxy.init)) {
        return $0.trailing == $1.leading - amount
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
@discardableResult public func distribute(by amount: CGFloat = 0.0, horizontally first: SupportsLeadingLayoutProxy & SupportsTrailingLayoutProxy, _ rest: (SupportsLeadingLayoutProxy & SupportsTrailingLayoutProxy)...) -> [NSLayoutConstraint] {
    return distribute(by: amount, horizontally: [first] + rest)
}

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
@discardableResult public func distribute(by amount: CGFloat = 0.0, leftToRight elements: [SupportsLeftLayoutProxy & SupportsRightLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(elements.map(AnyLeftToRightDistributionLayoutProxy.init)) {
        return $0.right == $1.left - amount
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
@discardableResult public func distribute(by amount: CGFloat = 0.0, leftToRight first: SupportsLeftLayoutProxy & SupportsRightLayoutProxy, _ rest: (SupportsLeftLayoutProxy & SupportsRightLayoutProxy)...) -> [NSLayoutConstraint] {
    return distribute(by: amount, leftToRight: [first] + rest)
}

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
@discardableResult public func distribute(by amount: CGFloat = 0.0, vertically elements: [SupportsTopLayoutProxy & SupportsBottomLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(elements.map(AnyVerticalDistributionLayoutProxy.init)) {
        return $0.bottom == $1.top - amount
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
@discardableResult public func distribute(by amount: CGFloat = 0.0, vertically first: SupportsTopLayoutProxy & SupportsBottomLayoutProxy, _ rest: (SupportsTopLayoutProxy & SupportsBottomLayoutProxy)...) -> [NSLayoutConstraint] {
    return distribute(by: amount, vertically: [first] + rest)
}
