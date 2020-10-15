//
//  Compound.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS)
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
public func == <P: RelativeCompoundEquality>(lhs: P, rhs: Expression<P>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value)
}

/// Declares a property equal to another compound property.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The other property.
///
public func == <P: RelativeCompoundEquality>(lhs: P, rhs: P) -> [NSLayoutConstraint] {
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
public func <= <P: RelativeCompoundInequality>(lhs: P, rhs: P) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

/// Declares a property greater than or equal to another compound property.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The other property.
///
/// - returns: An `NSLayoutConstraint`.
///
public func >= <P: RelativeCompoundInequality>(lhs: P, rhs: P) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

/// Declares a property less than or equal to the result of an expression.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The other property.
///
/// - returns: An `NSLayoutConstraint`.
///
public func <= <P: RelativeCompoundInequality>(lhs: P, rhs: Expression<P>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

/// Declares a property greater than or equal to the result of an expression.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The other property.
///
/// - returns: An `NSLayoutConstraint`.
///
public func >= <P: RelativeCompoundInequality>(lhs: P, rhs: Expression<P>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}
