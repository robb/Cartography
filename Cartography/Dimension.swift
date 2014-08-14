//
//  Dimension.swift
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

// MARK: Equality

public func ==(lhs: Dimension, rhs: Float) -> NSLayoutConstraint {
    return apply(lhs, coefficients: Coefficients(1, rhs))
}

public func ==(lhs: Float, rhs: Dimension) -> NSLayoutConstraint {
    return rhs == lhs
}

public func ==(lhs: Dimension, rhs: Expression<Dimension>) -> NSLayoutConstraint {
    return apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value)
}

public func ==(lhs: Expression<Dimension>, rhs: Dimension) -> NSLayoutConstraint {
    return rhs == lhs
}

public func ==(lhs: Dimension, rhs: Dimension) -> NSLayoutConstraint {
    return apply(lhs, to: rhs)
}

// MARK: Inequality

public func <=(lhs: Dimension, rhs: Float) -> NSLayoutConstraint {
    return apply(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.LessThanOrEqual)
}

public func <=(lhs: Float, rhs: Dimension) -> NSLayoutConstraint {
    return rhs >= lhs
}

public func >=(lhs: Dimension, rhs: Float) -> NSLayoutConstraint {
    return apply(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func >=(lhs: Float, rhs: Dimension) -> NSLayoutConstraint {
    return rhs <= lhs
}

public func <=(lhs: Dimension, rhs: Dimension) -> NSLayoutConstraint {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

public func >=(lhs: Dimension, rhs: Dimension) -> NSLayoutConstraint {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func <=(lhs: Dimension, rhs: Expression<Dimension>) -> NSLayoutConstraint {
    return apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

public func <=(lhs: Expression<Dimension>, rhs: Dimension) -> NSLayoutConstraint {
    return rhs >= lhs
}

public func >=(lhs: Dimension, rhs: Expression<Dimension>) -> NSLayoutConstraint {
    return apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func >=(lhs: Expression<Dimension>, rhs: Dimension) -> NSLayoutConstraint {
    return rhs <= lhs
}

// MARK: Addition

public func +(c: Float, rhs: Dimension) -> Expression<Dimension> {
    return Expression(rhs, [ Coefficients(1, c) ])
}

public func +(lhs: Dimension, rhs: Float) -> Expression<Dimension> {
    return rhs + lhs
}

public func +(c: Float, rhs: Expression<Dimension>) -> Expression<Dimension> {
    return Expression(rhs.value, rhs.coefficients.map { $0 + c })
}

public func +(lhs: Expression<Dimension>, rhs: Float) -> Expression<Dimension> {
    return rhs + lhs
}

// MARK: Subtraction

public func -(c: Float, rhs: Dimension) -> Expression<Dimension> {
    return Expression(rhs, [ Coefficients(1, -c) ])
}

public func -(lhs: Dimension, rhs: Float) -> Expression<Dimension> {
    return rhs - lhs
}

public func -(c: Float, rhs: Expression<Dimension>) -> Expression<Dimension> {
    return Expression(rhs.value, rhs.coefficients.map { $0 - c})
}

public func -(lhs: Expression<Dimension>, rhs: Float) -> Expression<Dimension> {
    return rhs - lhs
}

// MARK: Multiplication

public func *(m: Float, rhs: Expression<Dimension>) -> Expression<Dimension> {
    return Expression(rhs.value, rhs.coefficients.map { $0 * m })
}

public func *(lhs: Expression<Dimension>, rhs: Float) -> Expression<Dimension> {
    return rhs * lhs
}

public func *(m: Float, rhs: Dimension) -> Expression<Dimension> {
    return Expression(rhs, [ Coefficients(m, 0) ])
}

public func *(lhs: Dimension, rhs: Float) -> Expression<Dimension> {
    return rhs * lhs
}

// MARK: Division

public func /(m: Float, rhs: Expression<Dimension>) -> Expression<Dimension> {
    return Expression(rhs.value, rhs.coefficients.map { $0 / m })
}

public func /(lhs: Expression<Dimension>, rhs: Float) -> Expression<Dimension> {
    return rhs / lhs
}

public func /(m: Float, rhs: Dimension) -> Expression<Dimension> {
    return Expression(rhs, [ Coefficients(1 / m, 0) ])
}

public func /(lhs: Dimension, rhs: Float) -> Expression<Dimension> {
    return rhs / lhs
}
