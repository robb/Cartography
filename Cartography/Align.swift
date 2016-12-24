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
        first.view.car_translatesAutoresizingMaskIntoConstraints = false
        
        let rest = elements.dropFirst()
        
        return rest.reduce([]) { acc, current in
            current.view.car_translatesAutoresizingMaskIntoConstraints = false
            
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
@discardableResult public func align(top views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.top }, elements: views)
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
@discardableResult public func align(right views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.right }, elements: views)
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
@discardableResult public func align(bottom views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.bottom }, elements: views)
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
@discardableResult public func align(left views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.left }, elements: views)
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
@discardableResult public func align(leading views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.leading }, elements: views)
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
@discardableResult public func align(trailing views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.trailing }, elements: views)
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
@discardableResult public func align(centerX views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.centerX }, elements: views)
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
@discardableResult public func align(centerY views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.centerY }, elements: views)
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
@discardableResult public func align(baseline views: [LayoutProxy]) -> [NSLayoutConstraint] {
    return makeEqual(by: { $0.baseline }, elements: views)
}

/// Aligns multiple views by their top edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(top first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return align(top: [first] + rest)
}

/// Aligns multiple views by their right edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(right first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return align(right: [first] + rest)
}

/// Aligns multiple views by their bottom edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(bottom first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return align(bottom: [first] + rest)
}

/// Aligns multiple views by their left edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(left first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return align(left: [first] + rest)
}

/// Aligns multiple views by their leading edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(leading first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return align(leading: [first] + rest)
}

/// Aligns multiple vies by their trailing edge.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(trailing first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return align(trailing: [first] + rest)
}

/// Aligns multiple views by their horizontal center.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerX first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return align(centerX: [first] + rest)
}

/// Aligns multiple views by their vertical center.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(centerY first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return align(centerY: [first] + rest)
}

/// Aligns multiple views by their baseline.
///
/// All views passed to this function will have
/// their `translatesAutoresizingMaskIntoConstraints` properties set to `false`.
///
/// - returns: An array of `NSLayoutConstraint` instances.
///
@discardableResult public func align(baseline first: LayoutProxy, _ rest: LayoutProxy...) -> [NSLayoutConstraint] {
    return align(baseline: [first] + rest)
}
