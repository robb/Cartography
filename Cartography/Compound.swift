//
//  Compound.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

public protocol Compound {
    var context: Context { get }
    var properties: [Property] { get }
}

/// Compound properties conforming to this protocol can use the `==` operator
/// with other compound properties of the same type.
public protocol RelativeCompoundEquality : Compound { }

/// Declares a property equal to a the result of an expression.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The expression.
///
/// - returns: An `NSLayoutConstraint`.
///
@discardableResult public func == <P: RelativeCompoundEquality>(lhs: P, rhs: Expression<P>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value)
}

/// Declares a property equal to another compound property.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The other property.
///
@discardableResult public func == <P: RelativeCompoundEquality>(lhs: P, rhs: P) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs)
}

/// Compound properties conforming to this protocol can use the `<=` and `>=`
/// operators with other compound properties of the same type.
public protocol RelativeCompoundInequality : Compound { }

/// Declares a property less than or equal to another compound property.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The other property.
///
/// - returns: An `NSLayoutConstraint`.
///
@discardableResult public func <= <P: RelativeCompoundInequality>(lhs: P, rhs: P) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.lessThanOrEqual)
}

/// Declares a property greater than or equal to another compound property.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The other property.
///
/// - returns: An `NSLayoutConstraint`.
///
@discardableResult public func >= <P: RelativeCompoundInequality>(lhs: P, rhs: P) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.greaterThanOrEqual)
}

/// Declares a property less than or equal to the result of an expression.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The other property.
///
/// - returns: An `NSLayoutConstraint`.
///
@discardableResult public func <= <P: RelativeCompoundInequality>(lhs: P, rhs: Expression<P>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.lessThanOrEqual)
}

/// Declares a property greater than or equal to the result of an expression.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The other property.
///
/// - returns: An `NSLayoutConstraint`.
///
@discardableResult public func >= <P: RelativeCompoundInequality>(lhs: P, rhs: Expression<P>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.greaterThanOrEqual)
}

#if os(iOS) || os(tvOS)

    /// Declares a property equal to a layout support.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The layout support.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///

    @discardableResult public func == <P: RelativeEquality>(lhs: P, rhs: LayoutSupport) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, to: rhs)
    }

    /// Declares a property equal to the result of a layout support expression.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The layout support expression.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///

    @discardableResult public func == <P: RelativeEquality>(lhs: P, rhs: Expression<LayoutSupport>) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, to: rhs.value, coefficients: rhs.coefficients[0])
    }

    /// Declares a property greater than or equal to a layout support.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The layout support.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///

    @discardableResult public func >= <P: RelativeEquality>(lhs: P, rhs: LayoutSupport) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.greaterThanOrEqual)
    }
    
    /// Declares a property less than or equal to a layout support.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The layout support.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///

    @discardableResult public func <= <P: RelativeEquality>(lhs: P, rhs: LayoutSupport) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.lessThanOrEqual)
    }

    /// Declares a property greater than or equal to the result of a layout support expression.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The layout support.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///

    @discardableResult public func >= <P: RelativeEquality>(lhs: P, rhs: Expression<LayoutSupport>) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, to: rhs.value, coefficients: rhs.coefficients[0], relation: NSLayoutRelation.greaterThanOrEqual)
    }

    /// Declares a property less than or equal to the result of a layout support expression.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The layout support.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///

    @discardableResult public func <= <P: RelativeEquality>(lhs: P, rhs: Expression<LayoutSupport>) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, to: rhs.value, coefficients: rhs.coefficients[0], relation: NSLayoutRelation.lessThanOrEqual)
    }
    
#endif
