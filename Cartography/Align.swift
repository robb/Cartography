//
//  Align.swift
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

private func makeEqual<P: RelativeEquality, T: LayoutProxy>(by attribute: (T) -> P, items: [T]) -> [NSLayoutConstraint] {
    if let first = items.first {
        if let first = first as? AutoresizingMaskLayoutProxy {
            first.translatesAutoresizingMaskIntoConstraints = false
        }

        let rest = items.dropFirst()
        
        return rest.reduce([]) { acc, current in
            if let current = current as? AutoresizingMaskLayoutProxy {
                current.translatesAutoresizingMaskIntoConstraints = false
            }

            return acc + [ attribute(first) == attribute(current) ]
        }
    } else {
        return []
    }
}

/// Aligns multiple items by their top edge.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter items: an array of items to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(top items: [SupportsTopLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.top }, items: items.map(AnyTopLayoutProxy.init))
}

/// Aligns multiple items by their top edge.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(top first: SupportsTopLayoutProxy, _ rest: SupportsTopLayoutProxy...) -> [NSLayoutConstraint] {
    return align(top: [first] + rest)
}

/// Aligns multiple items by their right edge.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter items: an array of items to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(right items: [SupportsRightLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.right }, items: items.map(AnyRightLayoutProxy.init))
}

/// Aligns multiple items by their right edge.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(right first: SupportsRightLayoutProxy, _ rest: SupportsRightLayoutProxy...) -> [NSLayoutConstraint] {
    return align(right: [first] + rest)
}

/// Aligns multiple items by their bottom edge.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter items: an array of items to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(bottom items: [SupportsBottomLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.bottom }, items: items.map(AnyBottomLayoutProxy.init))
}

/// Aligns multiple items by their bottom edge.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(bottom first: SupportsBottomLayoutProxy, _ rest: SupportsBottomLayoutProxy...) -> [NSLayoutConstraint] {
    return align(bottom: [first] + rest)
}

/// Aligns multiple items by their left edge.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter items: an array of items to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(left items: [SupportsLeftLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.left }, items: items.map(AnyLeftLayoutProxy.init))
}

/// Aligns multiple items by their left edge.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(left first: SupportsLeftLayoutProxy, _ rest: SupportsLeftLayoutProxy...) -> [NSLayoutConstraint] {
    return align(left: [first] + rest)
}

/// Aligns multiple items by their leading edge.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter items: an array of items to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(leading items: [SupportsLeadingLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.leading }, items: items.map(AnyLeadingLayoutProxy.init))
}

/// Aligns multiple items by their leading edge.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(leading first: SupportsLeadingLayoutProxy, _ rest: SupportsLeadingLayoutProxy...) -> [NSLayoutConstraint] {
    return align(leading: [first] + rest)
}

/// Aligns multiple items by their trailing edge.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter items: an array of items to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(trailing items: [SupportsTrailingLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.trailing }, items: items.map(AnyTrailingLayoutProxy.init))
}

/// Aligns multiple vies by their trailing edge.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(trailing first: SupportsTrailingLayoutProxy, _ rest: SupportsTrailingLayoutProxy...) -> [NSLayoutConstraint] {
    return align(trailing: [first] + rest)
}

/// Aligns multiple items by their horizontal center.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter items: an array of items to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerX items: [SupportsCenterXLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.centerX }, items: items.map(AnyCenterXLayoutProxy.init))
}

/// Aligns multiple items by their horizontal center.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerX first: SupportsCenterXLayoutProxy, _ rest: SupportsCenterXLayoutProxy...) -> [NSLayoutConstraint] {
    return align(centerX: [first] + rest)
}

/// Aligns multiple items by their vertical center.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter items: an array of items to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerY items: [SupportsCenterYLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.centerY }, items: items.map(AnyCenterYLayoutProxy.init))
}

/// Aligns multiple items by their vertical center.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerY first: SupportsCenterYLayoutProxy, _ rest: SupportsCenterYLayoutProxy...) -> [NSLayoutConstraint] {
    return align(centerY: [first] + rest)
}

/// Aligns multiple items by their baseline.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter items: an array of items to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(baseline items: [SupportsBaselineLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.baseline }, items: items.map(AnyBaselineLayoutProxy.init))
}

/// Aligns multiple items by their baseline.
///
/// All items passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(baseline first: SupportsBaselineLayoutProxy, _ rest: SupportsBaselineLayoutProxy...) -> [NSLayoutConstraint] {
    return align(baseline: [first] + rest)
}
