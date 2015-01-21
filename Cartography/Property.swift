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
public protocol ConstantEquality : Property { }

public func ==(lhs: ConstantEquality, rhs: Float) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, coefficients: Coefficients(1, rhs))
}

public func ==(lhs: Float, rhs: ConstantEquality) -> NSLayoutConstraint {
    return rhs == lhs
}

/// Properties conforming to this protocol can use the `==` operator with other
/// properties of the same type.
public protocol RelativeEquality : Property { }

public func ==<P: RelativeEquality>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients[0], to: rhs.value)
}

public func ==<P: RelativeEquality>(lhs: Expression<P>, rhs: P) -> NSLayoutConstraint {
    return rhs == lhs
}

public func ==<P: RelativeEquality>(lhs: P, rhs: P) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, to: rhs)
}

// MARK: Inequality

/// Properties conforming to this protocol can use the `<=` and `>=` operators
/// with numerical constants.
public protocol ConstantInequality : Property { }

public func <=(lhs: ConstantInequality, rhs: Float) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.LessThanOrEqual)
}

public func <=(lhs: Float, rhs: ConstantInequality) -> NSLayoutConstraint {
    return rhs >= lhs
}

public func >=(lhs: ConstantInequality, rhs: Float) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func >=(lhs: Float, rhs: ConstantInequality) -> NSLayoutConstraint {
    return rhs <= lhs
}

/// Properties conforming to this protocol can use the `<=` and `>=` operators
/// with other properties of the same type.
public protocol RelativeInequality : Property { }

public func <=<P: RelativeInequality>(lhs: P, rhs: P) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

public func >=<P: RelativeInequality>(lhs: P, rhs: P) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func <=<P: RelativeInequality>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

public func <=<P: RelativeInequality>(lhs: Expression<P>, rhs: P) -> NSLayoutConstraint {
    return rhs >= lhs
}

public func >=<P: RelativeInequality>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func >=<P: RelativeInequality>(lhs: Expression<P>, rhs: P) -> NSLayoutConstraint {
    return rhs <= lhs
}

// Mark: Addition

public protocol Addition : Property { }

public func +<P: Addition>(c: Float, rhs: P) -> Expression<P> {
    return Expression(rhs, [ Coefficients(1, c) ])
}

public func +<P: Addition>(lhs: P, rhs: Float) -> Expression<P> {
    return rhs + lhs
}

public func +<P: Addition>(c: Float, rhs: Expression<P>) -> Expression<P> {
    return Expression(rhs.value, rhs.coefficients.map { $0 + c })
}

public func +<P: Addition>(lhs: Expression<P>, rhs: Float) -> Expression<P> {
    return rhs + lhs
}

public func -<P: Addition>(c: Float, rhs: P) -> Expression<P> {
    return Expression(rhs, [ Coefficients(1, -c) ])
}

public func -<P: Addition>(lhs: P, rhs: Float) -> Expression<P> {
    return rhs - lhs
}

public func -<P: Addition>(c: Float, rhs: Expression<P>) -> Expression<P> {
    return Expression(rhs.value, rhs.coefficients.map { $0 - c})
}

public func -<P: Addition>(lhs: Expression<P>, rhs: Float) -> Expression<P> {
    return rhs - lhs
}

// MARK: Multiplication

public protocol Multiplication : Property { }

public func *<P: Multiplication>(m: Float, rhs: Expression<P>) -> Expression<P> {
    return Expression(rhs.value, rhs.coefficients.map { $0 * m })
}

public func *<P: Multiplication>(lhs: Expression<P>, rhs: Float) -> Expression<P> {
    return rhs * lhs
}

public func *<P: Multiplication>(m: Float, rhs: P) -> Expression<P> {
    return Expression(rhs, [ Coefficients(m, 0) ])
}

public func *<P: Multiplication>(lhs: P, rhs: Float) -> Expression<P> {
    return rhs * lhs
}

public func /<P: Multiplication>(m: Float, rhs: Expression<P>) -> Expression<P> {
    return Expression(rhs.value, rhs.coefficients.map { $0 / m })
}

public func /<P: Multiplication>(lhs: Expression<P>, rhs: Float) -> Expression<P> {
    return rhs / lhs
}

public func /<P: Multiplication>(m: Float, rhs: P) -> Expression<P> {
    return Expression(rhs, [ Coefficients(1 / m, 0) ])
}

public func /<P: Multiplication>(lhs: P, rhs: Float) -> Expression<P> {
    return rhs / lhs
}
