//
//  Dimension.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public enum Dimension : Property {
    case Width(View)
    case Height(View)

    var view: View {
        switch (self) {
            case let .Width(view): return view
            case let .Height(view): return view
        }
    }

    var attribute: NSLayoutAttribute {
        switch (self) {
            case .Width(_): return NSLayoutAttribute.Width
            case .Height(_): return NSLayoutAttribute.Height
        }
    }
}

// Equality

@infix public func ==(lhs: Dimension, rhs: Float) -> NSLayoutConstraint {
    return apply(lhs, coefficients: Coefficients(1, rhs))
}

@infix public func ==(lhs: Float, rhs: Dimension) -> NSLayoutConstraint {
    return rhs == lhs
}

@infix public func ==(lhs: Dimension, rhs: Expression<Dimension>) -> NSLayoutConstraint {
    return apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value)
}

@infix public func ==(lhs: Expression<Dimension>, rhs: Dimension) -> NSLayoutConstraint {
    return rhs == lhs
}

@infix public func ==(lhs: Dimension, rhs: Dimension) -> NSLayoutConstraint {
    return apply(lhs, to: rhs)
}

// Inequality

@infix public func <=(lhs: Dimension, rhs: Float) -> NSLayoutConstraint {
    return apply(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.LessThanOrEqual)
}

@infix public func <=(lhs: Float, rhs: Dimension) -> NSLayoutConstraint {
    return rhs >= lhs
}

@infix public func >=(lhs: Dimension, rhs: Float) -> NSLayoutConstraint {
    return apply(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix public func >=(lhs: Float, rhs: Dimension) -> NSLayoutConstraint {
    return rhs <= lhs
}

@infix public func <=(lhs: Dimension, rhs: Dimension) -> NSLayoutConstraint {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix public func >=(lhs: Dimension, rhs: Dimension) -> NSLayoutConstraint {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix public func <=(lhs: Dimension, rhs: Expression<Dimension>) -> NSLayoutConstraint {
    return apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix public func <=(lhs: Expression<Dimension>, rhs: Dimension) -> NSLayoutConstraint {
    return rhs >= lhs
}

@infix public func >=(lhs: Dimension, rhs: Expression<Dimension>) -> NSLayoutConstraint {
    return apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix public func >=(lhs: Expression<Dimension>, rhs: Dimension) -> NSLayoutConstraint {
    return rhs <= lhs
}

// Addition

@infix public func +(c: Float, rhs: Dimension) -> Expression<Dimension> {
    return Expression(rhs, [ Coefficients(1, c) ])
}

@infix public func +(lhs: Dimension, rhs: Float) -> Expression<Dimension> {
    return rhs + lhs
}

@infix public func +(c: Float, rhs: Expression<Dimension>) -> Expression<Dimension> {
    return Expression(rhs.value, rhs.coefficients.map { $0 + c })
}

@infix public func +(lhs: Expression<Dimension>, rhs: Float) -> Expression<Dimension> {
    return rhs + lhs
}

// Subtraction

@infix public func -(c: Float, rhs: Dimension) -> Expression<Dimension> {
    return Expression(rhs, [ Coefficients(1, -c) ])
}

@infix public func -(lhs: Dimension, rhs: Float) -> Expression<Dimension> {
    return rhs - lhs
}

@infix public func -(c: Float, rhs: Expression<Dimension>) -> Expression<Dimension> {
    return Expression(rhs.value, rhs.coefficients.map { $0 - c})
}

@infix public func -(lhs: Expression<Dimension>, rhs: Float) -> Expression<Dimension> {
    return rhs - lhs
}

// Multiplication

@infix public func *(m: Float, rhs: Expression<Dimension>) -> Expression<Dimension> {
    return Expression(rhs.value, rhs.coefficients.map { $0 * m })
}

@infix public func *(lhs: Expression<Dimension>, rhs: Float) -> Expression<Dimension> {
    return rhs * lhs
}

@infix public func *(m: Float, rhs: Dimension) -> Expression<Dimension> {
    return Expression(rhs, [ Coefficients(m, 0) ])
}

@infix public func *(lhs: Dimension, rhs: Float) -> Expression<Dimension> {
    return rhs * lhs
}

// Division

@infix public func /(m: Float, rhs: Expression<Dimension>) -> Expression<Dimension> {
    return Expression(rhs.value, rhs.coefficients.map { $0 / m })
}

@infix public func /(lhs: Expression<Dimension>, rhs: Float) -> Expression<Dimension> {
    return rhs / lhs
}

@infix public func /(m: Float, rhs: Dimension) -> Expression<Dimension> {
    return Expression(rhs, [ Coefficients(1 / m, 0) ])
}

@infix public func /(lhs: Dimension, rhs: Float) -> Expression<Dimension> {
    return rhs / lhs
}
