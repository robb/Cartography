//
//  Size.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public enum Size : Compound {
    case Size(View)

    var properties: [Property] {
        switch (self) {
            case let .Size(view):
                return [ Dimension.Width(view), Dimension.Height(view) ]
        }
    }
}

// Equality

@infix public func ==(lhs: Size, rhs: Expression<Size>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value)
}

@infix public func ==(lhs: Expression<Size>, rhs: Size) -> [NSLayoutConstraint] {
    return rhs == lhs
}

@infix public func ==(lhs: Size, rhs: Size) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs)
}

// Inequality

@infix public func <=(lhs: Size, rhs: Size) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix public func >=(lhs: Size, rhs: Size) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix public func <=(lhs: Size, rhs: Expression<Size>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix public func <=(lhs: Expression<Size>, rhs: Size) -> [NSLayoutConstraint] {
    return rhs >= lhs
}

@infix public func >=(lhs: Size, rhs: Expression<Size>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix public func >=(lhs: Expression<Size>, rhs: Size) -> [NSLayoutConstraint] {
    return rhs <= lhs
}

// Multiplication

@infix public func *(m: Float, rhs: Expression<Size>) -> Expression<Size> {
    return Expression(rhs.value, rhs.coefficients.map { $0 * m })
}

@infix public func *(lhs: Expression<Size>, rhs: Float) -> Expression<Size> {
    return rhs * lhs
}

@infix public func *(m: Float, rhs: Size) -> Expression<Size> {
    return Expression(rhs, [ Coefficients(m, 0), Coefficients(m, 0) ])
}

@infix public func *(lhs: Size, rhs: Float) -> Expression<Size> {
    return rhs * lhs
}

// Division

@infix public func /(m: Float, rhs: Expression<Size>) -> Expression<Size> {
    return Expression(rhs.value, rhs.coefficients.map { $0 / m })
}

@infix public func /(lhs: Expression<Size>, rhs: Float) -> Expression<Size> {
    return rhs / lhs
}

@infix public func /(m: Float, rhs: Size) -> Expression<Size> {
    return Expression(rhs, [ Coefficients(1 / m, 0), Coefficients(1 / m, 0) ])
}

@infix public func /(lhs: Size, rhs: Float) -> Expression<Size> {
    return rhs / lhs
}
