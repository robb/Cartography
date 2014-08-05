//
//  Size.swift
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

public func ==(lhs: Size, rhs: Expression<Size>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value)
}

public func ==(lhs: Expression<Size>, rhs: Size) -> [NSLayoutConstraint] {
    return rhs == lhs
}

public func ==(lhs: Size, rhs: Size) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs)
}

// Inequality

public func <=(lhs: Size, rhs: Size) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

public func >=(lhs: Size, rhs: Size) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func <=(lhs: Size, rhs: Expression<Size>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

public func <=(lhs: Expression<Size>, rhs: Size) -> [NSLayoutConstraint] {
    return rhs >= lhs
}

public func >=(lhs: Size, rhs: Expression<Size>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func >=(lhs: Expression<Size>, rhs: Size) -> [NSLayoutConstraint] {
    return rhs <= lhs
}

// Addition

public func +(m: Float, rhs: Expression<Size>) -> Expression<Size> {
    return Expression(rhs.value, rhs.coefficients.map { $0 + m })
}

public func +(lhs: Expression<Size>, rhs: Float) -> Expression<Size> {
    return rhs + lhs
}

public func +(m: Float, rhs: Size) -> Expression<Size> {

    return Expression(rhs, [ Coefficients(1, m), Coefficients(1, m) ])
}

public func +(lhs: Size, rhs: Float) -> Expression<Size> {
    return rhs + lhs
}

// Subtraction

public func -(m: Float, rhs: Expression<Size>) -> Expression<Size> {
    return Expression(rhs.value, rhs.coefficients.map { $0 - m })
}

public func -(lhs: Expression<Size>, rhs: Float) -> Expression<Size> {
    return rhs - lhs
}

public func -(m: Float, rhs: Size) -> Expression<Size> {
    return Expression(rhs, [ Coefficients(1, -m), Coefficients(1, -m) ])
}

public func -(lhs: Size, rhs: Float) -> Expression<Size> {
    return rhs - lhs
}

// Multiplication

public func *(m: Float, rhs: Expression<Size>) -> Expression<Size> {
    return Expression(rhs.value, rhs.coefficients.map { $0 * m })
}

public func *(lhs: Expression<Size>, rhs: Float) -> Expression<Size> {
    return rhs * lhs
}

public func *(m: Float, rhs: Size) -> Expression<Size> {
    return Expression(rhs, [ Coefficients(m, 0), Coefficients(m, 0) ])
}

public func *(lhs: Size, rhs: Float) -> Expression<Size> {
    return rhs * lhs
}

// Division

public func /(m: Float, rhs: Expression<Size>) -> Expression<Size> {
    return Expression(rhs.value, rhs.coefficients.map { $0 / m })
}

public func /(lhs: Expression<Size>, rhs: Float) -> Expression<Size> {
    return rhs / lhs
}

public func /(m: Float, rhs: Size) -> Expression<Size> {
    return Expression(rhs, [ Coefficients(1 / m, 0), Coefficients(1 / m, 0) ])
}

public func /(lhs: Size, rhs: Float) -> Expression<Size> {
    return rhs / lhs
}
