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

private func makeEqual<P: RelativeEquality, T: LayoutProxy>(by attribute: (T) -> P, elements: [T]) -> [NSLayoutConstraint] {
    if let first = elements.first {
        let rest = elements.dropFirst()
        
        return rest.reduce([]) { acc, current in
            return acc + [ attribute(first) == attribute(current) ]
        }
    } else {
        return []
    }
}

/// Aligns multiple elements by their top edge.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter elements: an array of elements to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(top elements: [SupportsTopLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.top }, elements: elements.map(AnyTopLayoutProxy.init))
}

/// Aligns multiple elements by their top edge.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(top first: SupportsTopLayoutProxy, _ rest: SupportsTopLayoutProxy...) -> [NSLayoutConstraint] {
    return align(top: [first] + rest)
}

/// Aligns multiple elements by their right edge.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter elements: an array of elements to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(right elements: [SupportsRightLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.right }, elements: elements.map(AnyRightLayoutProxy.init))
}

/// Aligns multiple elements by their right edge.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(right first: SupportsRightLayoutProxy, _ rest: SupportsRightLayoutProxy...) -> [NSLayoutConstraint] {
    return align(right: [first] + rest)
}

/// Aligns multiple elements by their bottom edge.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter elements: an array of elements to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(bottom elements: [SupportsBottomLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.bottom }, elements: elements.map(AnyBottomLayoutProxy.init))
}

/// Aligns multiple elements by their bottom edge.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(bottom first: SupportsBottomLayoutProxy, _ rest: SupportsBottomLayoutProxy...) -> [NSLayoutConstraint] {
    return align(bottom: [first] + rest)
}

/// Aligns multiple elements by their left edge.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter elements: an array of elements to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(left elements: [SupportsLeftLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.left }, elements: elements.map(AnyLeftLayoutProxy.init))
}

/// Aligns multiple elements by their left edge.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(left first: SupportsLeftLayoutProxy, _ rest: SupportsLeftLayoutProxy...) -> [NSLayoutConstraint] {
    return align(left: [first] + rest)
}

/// Aligns multiple elements by their leading edge.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter elements: an array of elements to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(leading elements: [SupportsLeadingLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.leading }, elements: elements.map(AnyLeadingLayoutProxy.init))
}

/// Aligns multiple elements by their leading edge.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(leading first: SupportsLeadingLayoutProxy, _ rest: SupportsLeadingLayoutProxy...) -> [NSLayoutConstraint] {
    return align(leading: [first] + rest)
}

/// Aligns multiple elements by their trailing edge.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter elements: an array of elements to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(trailing elements: [SupportsTrailingLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.trailing }, elements: elements.map(AnyTrailingLayoutProxy.init))
}

/// Aligns multiple vies by their trailing edge.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(trailing first: SupportsTrailingLayoutProxy, _ rest: SupportsTrailingLayoutProxy...) -> [NSLayoutConstraint] {
    return align(trailing: [first] + rest)
}

/// Aligns multiple elements by their horizontal center.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter elements: an array of elements to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerX elements: [SupportsCenterXLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.centerX }, elements: elements.map(AnyCenterXLayoutProxy.init))
}

/// Aligns multiple elements by their horizontal center.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerX first: SupportsCenterXLayoutProxy, _ rest: SupportsCenterXLayoutProxy...) -> [NSLayoutConstraint] {
    return align(centerX: [first] + rest)
}

/// Aligns multiple elements by their vertical center.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter elements: an array of elements to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerY elements: [SupportsCenterYLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.centerY }, elements: elements.map(AnyCenterYLayoutProxy.init))
}

/// Aligns multiple elements by their vertical center.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerY first: SupportsCenterYLayoutProxy, _ rest: SupportsCenterYLayoutProxy...) -> [NSLayoutConstraint] {
    return align(centerY: [first] + rest)
}

/// Aligns multiple elements by their baseline.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter elements: an array of elements to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(baseline elements: [SupportsBaselineLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.baseline }, elements: elements.map(AnyBaselineLayoutProxy.init))
}

/// Aligns multiple elements by their baseline.
///
/// All elements passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(baseline first: SupportsBaselineLayoutProxy, _ rest: SupportsBaselineLayoutProxy...) -> [NSLayoutConstraint] {
    return align(baseline: [first] + rest)
}
