//
//  Distribute.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/02/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(visionOS)
    import UIKit
    #else
    import AppKit
#endif

@discardableResult private func reduce<T: LayoutProxy>(_ items: [T], combine: (T, T) -> NSLayoutConstraint) -> [NSLayoutConstraint] {
    if let last = items.last as? AutoresizingMaskLayoutProxy {
        last.translatesAutoresizingMaskIntoConstraints = false
    }

    if let first = items.first {
        let rest = items.dropFirst()
        
        return rest.reduce(([], first)) { (acc, current) -> ([NSLayoutConstraint], T) in
            let (constraints, previous) = acc
            
            return (constraints + [ combine(previous, current) ], current)
        }.0
    } else {
        return []
    }
}

/// Distributes multiple items horizontally.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the items.
/// - parameter items:  An array of items to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///

@discardableResult public func distribute(by amount: CGFloat = 0.0, horizontally items: [SupportsLeadingLayoutProxy & SupportsTrailingLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(items.map(AnyHorizontalDistributionLayoutProxy.init)) {
        return $0.trailing == $1.leading - amount
    }
}

/// Distributes multiple items horizontally.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the items.
/// - parameter items:  The items to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func distribute(by amount: CGFloat = 0.0, horizontally first: SupportsLeadingLayoutProxy & SupportsTrailingLayoutProxy, _ rest: (SupportsLeadingLayoutProxy & SupportsTrailingLayoutProxy)...) -> [NSLayoutConstraint] {
    return distribute(by: amount, horizontally: [first] + rest)
}

/// Distributes multiple items horizontally from left to right.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the items.
/// - parameter items:  An array of items to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func distribute(by amount: CGFloat = 0.0, leftToRight items: [SupportsLeftLayoutProxy & SupportsRightLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(items.map(AnyLeftToRightDistributionLayoutProxy.init)) {
        return $0.right == $1.left - amount
    }
}

/// Distributes multiple items horizontally from left to right.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the items.
/// - parameter items:  The items to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func distribute(by amount: CGFloat = 0.0, leftToRight first: SupportsLeftLayoutProxy & SupportsRightLayoutProxy, _ rest: (SupportsLeftLayoutProxy & SupportsRightLayoutProxy)...) -> [NSLayoutConstraint] {
    return distribute(by: amount, leftToRight: [first] + rest)
}

/// Distributes multiple items vertically.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the items.
/// - parameter items:  An array of items to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func distribute(by amount: CGFloat = 0.0, vertically items: [SupportsTopLayoutProxy & SupportsBottomLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(items.map(AnyVerticalDistributionLayoutProxy.init)) {
        return $0.bottom == $1.top - amount
    }
}

/// Distributes multiple items vertically.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter amount: The distance between the items.
/// - parameter items:  The items to distribute.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func distribute(by amount: CGFloat = 0.0, vertically first: SupportsTopLayoutProxy & SupportsBottomLayoutProxy, _ rest: (SupportsTopLayoutProxy & SupportsBottomLayoutProxy)...) -> [NSLayoutConstraint] {
    return distribute(by: amount, vertically: [first] + rest)
}

/// Distributes width for all the items.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - Parameter items: The items to distribute
///
/// - Returns: An array of `NSLayoutConstraint` instances
///
@discardableResult public func distribute(equalWidth items: [SupportsWidthLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(items.map(AnyWidthLayoutProxy.init)) { $0.width == $1.width }
}

/// Distributes width for all the items.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - Parameter items: The items to distribute
///
/// - Returns: An array of `NSLayoutConstraint` instances
///
@discardableResult public func distribute(equalWidth first: SupportsWidthLayoutProxy, _ rest: (SupportsWidthLayoutProxy)...) -> [NSLayoutConstraint] {
    return distribute(equalWidth: [first] + rest)
}

/// Distributes height for all the items.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - Parameter items: The items to distribute
///
/// - Returns: An array of `NSLayoutConstraint` instances
///
@discardableResult public func distribute(equalHeight items: [SupportsHeightLayoutProxy]) -> [NSLayoutConstraint] {
    return reduce(items.map(AnyHeightLayoutProxy.init)) { $0.height == $1.height }
}

/// Distributes height for all the items.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - Parameter items: The items to distribute
///
/// - Returns: An array of `NSLayoutConstraint` instances
///
@discardableResult public func distribute(equalHeight first: SupportsHeightLayoutProxy, _ rest: (SupportsHeightLayoutProxy)...) -> [NSLayoutConstraint] {
    return distribute(equalHeight: [first] + rest)
}
