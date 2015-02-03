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
    case Size(Context, View)

    var context: Context {
        switch (self) {
            case let .Size(context, _):
                return context
        }
    }

    var properties: [Property] {
        switch (self) {
            case let .Size(context, view):
                return [ Dimension.Width(context, view), Dimension.Height(context, view) ]
        }
    }
}

// MARK: Equality

public func ==(lhs: Size, rhs: Expression<Size>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value)
}

public func ==(lhs: Expression<Size>, rhs: Size) -> [NSLayoutConstraint] {
    return rhs == lhs
}

public func ==(lhs: Size, rhs: Size) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs)
}

// MARK: Inequality

public func <=(lhs: Size, rhs: Size) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

public func >=(lhs: Size, rhs: Size) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func <=(lhs: Size, rhs: Expression<Size>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

public func <=(lhs: Expression<Size>, rhs: Size) -> [NSLayoutConstraint] {
    return rhs >= lhs
}

public func >=(lhs: Size, rhs: Expression<Size>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func >=(lhs: Expression<Size>, rhs: Size) -> [NSLayoutConstraint] {
    return rhs <= lhs
}

// MARK: Multiplication

public func *(m: Number, rhs: Expression<Size>) -> Expression<Size> {
    return Expression(rhs.value, rhs.coefficients.map { $0 * m.doubleValue })
}

public func *(lhs: Expression<Size>, rhs: Number) -> Expression<Size> {
    return rhs * lhs
}

public func *(m: Number, rhs: Size) -> Expression<Size> {
    return Expression(rhs, [ Coefficients(m.doubleValue, 0), Coefficients(m.doubleValue, 0) ])
}

public func *(lhs: Size, rhs: Number) -> Expression<Size> {
    return rhs * lhs
}

// MARK: Division

public func /(m: Number, rhs: Expression<Size>) -> Expression<Size> {
    return Expression(rhs.value, rhs.coefficients.map { $0 / m.doubleValue })
}

public func /(lhs: Expression<Size>, rhs: Number) -> Expression<Size> {
    return rhs / lhs
}

public func /(m: Number, rhs: Size) -> Expression<Size> {
    return Expression(rhs, [ Coefficients(1 / m.doubleValue, 0), Coefficients(1 / m.doubleValue, 0) ])
}

public func /(lhs: Size, rhs: Number) -> Expression<Size> {
    return rhs / lhs
}
