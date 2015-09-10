//
//  Property.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

public protocol Property {
    var attribute: NSLayoutAttribute { get }
    var context: Context { get }
    var view: View { get }
}

// MARK: Equality

/// Properties conforming to this protocol can use the `==` operator with
/// numerical constants.
public protocol NumericalEquality : Property { }

/// Declares a property equal to a numerical constant.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The numerical constant.
///
/// - returns: An `NSLayoutConstraint`.
///
public func == (lhs: NumericalEquality, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, coefficients: Coefficients(1, rhs))
}

/// Properties conforming to this protocol can use the `==` operator with other
/// properties of the same type.
public protocol RelativeEquality : Property { }

/// Declares a property equal to a the result of an expression.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The expression.
///
/// - returns: An `NSLayoutConstraint`.
///
public func == <P: RelativeEquality>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients[0], to: rhs.value)
}

/// Declares a property equal to another property.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The other property.
///
public func == <P: RelativeEquality>(lhs: P, rhs: P) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, to: rhs)
}

// MARK: Inequality

/// Properties conforming to this protocol can use the `<=` and `>=` operators
/// with numerical constants.
public protocol NumericalInequality : Property { }

/// Declares a property less than or equal to a numerical constant.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The numerical constant.
///
/// - returns: An `NSLayoutConstraint`.
///
public func <= (lhs: NumericalInequality, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.LessThanOrEqual)
}

/// Declares a property greater than or equal to a numerical constant.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The numerical constant.
///
/// - returns: An `NSLayoutConstraint`.
///
public func >= (lhs: NumericalInequality, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.GreaterThanOrEqual)
}

/// Properties conforming to this protocol can use the `<=` and `>=` operators
/// with other properties of the same type.
public protocol RelativeInequality : Property { }

/// Declares a property less than or equal to another property.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The other property.
///
/// - returns: An `NSLayoutConstraint`.
///
public func <= <P: RelativeInequality>(lhs: P, rhs: P) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

/// Declares a property greater than or equal to another property.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The other property.
///
/// - returns: An `NSLayoutConstraint`.
///
public func >= <P: RelativeInequality>(lhs: P, rhs: P) -> NSLayoutConstraint {
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
public func <= <P: RelativeInequality>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

/// Declares a property greater than or equal to the result of an expression.
///
/// - parameter lhs: The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// - parameter rhs: The other property.
///
/// - returns: An `NSLayoutConstraint`.
///
public func >= <P: RelativeInequality>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

// Mark: Addition

public protocol Addition : Property { }

public func + <P: Addition>(c: CGFloat, rhs: P) -> Expression<P> {
    return Expression(rhs, [ Coefficients(1, c) ])
}

public func + <P: Addition>(lhs: P, rhs: CGFloat) -> Expression<P> {
    return rhs + lhs
}

public func + <P: Addition>(c: CGFloat, rhs: Expression<P>) -> Expression<P> {
    return Expression(rhs.value, rhs.coefficients.map { $0 + c })
}

public func + <P: Addition>(lhs: Expression<P>, rhs: CGFloat) -> Expression<P> {
    return rhs + lhs
}

public func - <P: Addition>(c: CGFloat, rhs: P) -> Expression<P> {
    return Expression(rhs, [ Coefficients(1, -c) ])
}

public func - <P: Addition>(lhs: P, rhs: CGFloat) -> Expression<P> {
    return rhs - lhs
}

public func - <P: Addition>(c: CGFloat, rhs: Expression<P>) -> Expression<P> {
    return Expression(rhs.value, rhs.coefficients.map { $0 - c})
}

public func - <P: Addition>(lhs: Expression<P>, rhs: CGFloat) -> Expression<P> {
    return rhs - lhs
}

// MARK: Multiplication

public protocol Multiplication : Property { }

public func * <P: Multiplication>(m: CGFloat, rhs: Expression<P>) -> Expression<P> {
    return Expression(rhs.value, rhs.coefficients.map { $0 * m })
}

public func * <P: Multiplication>(lhs: Expression<P>, rhs: CGFloat) -> Expression<P> {
    return rhs * lhs
}

public func * <P: Multiplication>(m: CGFloat, rhs: P) -> Expression<P> {
    return Expression(rhs, [ Coefficients(m, 0) ])
}

public func * <P: Multiplication>(lhs: P, rhs: CGFloat) -> Expression<P> {
    return rhs * lhs
}

public func / <P: Multiplication>(lhs: Expression<P>, rhs: CGFloat) -> Expression<P> {
    return lhs * (1 / rhs)
}

public func / <P: Multiplication>(lhs: P, rhs: CGFloat) -> Expression<P> {
    return lhs * (1 / rhs)
}
