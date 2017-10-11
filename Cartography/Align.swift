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

private func makeEqual<P: RelativeEquality>(by attribute: (LayoutProxy) -> P, elements: [LayoutProxy]) -> [NSLayoutConstraint] {
    if let first = elements.first {
        let rest = elements.dropFirst()
        
        return rest.reduce([]) { acc, current in
            return acc + [ attribute(first) == attribute(current) ]
        }
    } else {
        return []
    }
}

/// Aligns multiple views by their top edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter views: an array of views to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(top views: [SupportsTopLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { ($0 as! SupportsTopLayoutProxy).top }, elements: views)
}

/// Aligns multiple views by their top edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(top first: SupportsTopLayoutProxy, _ rest: SupportsTopLayoutProxy...) -> [NSLayoutConstraint] {
    return align(top: [first] + rest)
}

/// Aligns multiple views by their right edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter views: an array of views to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(right views: [SupportsRightLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { ($0 as! SupportsRightLayoutProxy).right }, elements: views)
}

/// Aligns multiple views by their right edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(right first: SupportsRightLayoutProxy, _ rest: SupportsRightLayoutProxy...) -> [NSLayoutConstraint] {
    return align(right: [first] + rest)
}

/// Aligns multiple views by their bottom edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter views: an array of views to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(bottom views: [SupportsBottomLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { ($0 as! SupportsBottomLayoutProxy).bottom }, elements: views)
}

/// Aligns multiple views by their bottom edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(bottom first: SupportsBottomLayoutProxy, _ rest: SupportsBottomLayoutProxy...) -> [NSLayoutConstraint] {
    return align(bottom: [first] + rest)
}

/// Aligns multiple views by their left edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter views: an array of views to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(left views: [SupportsLeftLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { ($0 as! SupportsLeftLayoutProxy).left }, elements: views)
}

/// Aligns multiple views by their left edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(left first: SupportsLeftLayoutProxy, _ rest: SupportsLeftLayoutProxy...) -> [NSLayoutConstraint] {
    return align(left: [first] + rest)
}

/// Aligns multiple views by their leading edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter views: an array of views to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(leading views: [SupportsLeadingLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { ($0 as! SupportsLeadingLayoutProxy).leading }, elements: views)
}

/// Aligns multiple views by their leading edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(leading first: SupportsLeadingLayoutProxy, _ rest: SupportsLeadingLayoutProxy...) -> [NSLayoutConstraint] {
    return align(leading: [first] + rest)
}

/// Aligns multiple views by their trailing edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter views: an array of views to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(trailing views: [SupportsTrailingLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { ($0 as! SupportsTrailingLayoutProxy).trailing }, elements: views)
}

/// Aligns multiple vies by their trailing edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(trailing first: SupportsTrailingLayoutProxy, _ rest: SupportsTrailingLayoutProxy...) -> [NSLayoutConstraint] {
    return align(trailing: [first] + rest)
}

/// Aligns multiple views by their horizontal center.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter views: an array of views to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerX views: [SupportsCenteringLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { ($0 as! SupportsCenteringLayoutProxy).centerX }, elements: views)
}

/// Aligns multiple views by their horizontal center.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerX first: SupportsCenteringLayoutProxy, _ rest: SupportsCenteringLayoutProxy...) -> [NSLayoutConstraint] {
    return align(centerX: [first] + rest)
}

/// Aligns multiple views by their vertical center.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter views: an array of views to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerY views: [SupportsCenteringLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { ($0 as! SupportsCenteringLayoutProxy).centerY }, elements: views)
}

/// Aligns multiple views by their vertical center.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerY first: SupportsCenteringLayoutProxy, _ rest: SupportsCenteringLayoutProxy...) -> [NSLayoutConstraint] {
    return align(centerY: [first] + rest)
}

/// Aligns multiple views by their baseline.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - parameter views: an array of views to align
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(baseline views: [SupportsBaselineLayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { ($0 as! SupportsBaselineLayoutProxy).baseline }, elements: views)
}

/// Aligns multiple views by their baseline.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(baseline first: SupportsBaselineLayoutProxy, _ rest: SupportsBaselineLayoutProxy...) -> [NSLayoutConstraint] {
    return align(baseline: [first] + rest)
}
