//
//  Edge.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public enum Edge : Property {
    case Top(View)
    case Right(View)
    case Bottom(View)
    case Left(View)

    case Leading(View)
    case Trailing(View)

    case CenterX(View)
    case CenterY(View)

    case Baseline(View)

    var view: View {
        switch (self) {
            case let .Top(view): return view
            case let .Right(view): return view
            case let .Bottom(view): return view
            case let .Left(view): return view

            case let .Leading(view): return view
            case let .Trailing(view): return view

            case let .CenterX(view): return view
            case let .CenterY(view): return view

            case let .Baseline(view): return view
        }
    }

    var attribute: NSLayoutAttribute {
        switch (self) {
            case let .Top(view): return NSLayoutAttribute.Top
            case let .Right(view): return NSLayoutAttribute.Right
            case let .Bottom(view): return NSLayoutAttribute.Bottom
            case let .Left(view): return NSLayoutAttribute.Left

            case let .Leading(view): return NSLayoutAttribute.Leading
            case let .Trailing(view): return NSLayoutAttribute.Trailing

            case let .CenterX(view): return NSLayoutAttribute.CenterX
            case let .CenterY(view): return NSLayoutAttribute.CenterY

            case let .Baseline(view): return NSLayoutAttribute.Baseline
        }
    }
}

// Equality

@infix public func ==(lhs: Edge, rhs: Expression<Edge>) -> NSLayoutConstraint {
    return apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value)
}

@infix public func ==(lhs: Expression<Edge>, rhs: Edge) -> NSLayoutConstraint {
    return rhs == lhs
}

@infix public func ==(lhs: Edge, rhs: Edge) -> NSLayoutConstraint {
    return apply(lhs, to: rhs)
}

// Inequality

@infix public func <=(lhs: Edge, rhs: Edge) -> NSLayoutConstraint {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix public func >=(lhs: Edge, rhs: Edge) -> NSLayoutConstraint {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix public func <=(lhs: Edge, rhs: Expression<Edge>) -> NSLayoutConstraint {
    return apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix public func <=(lhs: Expression<Edge>, rhs: Edge) -> NSLayoutConstraint {
    return rhs >= lhs
}

@infix public func >=(lhs: Edge, rhs: Expression<Edge>) -> NSLayoutConstraint {
    return apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix public func >=(lhs: Expression<Edge>, rhs: Edge) -> NSLayoutConstraint {
    return rhs <= lhs
}

// Addition

@infix public func +(c: Float, rhs: Edge) -> Expression<Edge> {
    return Expression(rhs, [ Coefficients(1, c) ])
}

@infix public func +(lhs: Edge, rhs: Float) -> Expression<Edge> {
    return rhs + lhs
}

@infix public func +(c: Float, rhs: Expression<Edge>) -> Expression<Edge> {
    return Expression(rhs.value, rhs.coefficients.map { $0 + c })
}

@infix public func +(lhs: Expression<Edge>, rhs: Float) -> Expression<Edge> {
    return rhs + lhs
}

// Subtraction

@infix public func -(c: Float, rhs: Edge) -> Expression<Edge> {
    return Expression(rhs, [ Coefficients(1, -c) ])
}

@infix public func -(lhs: Edge, rhs: Float) -> Expression<Edge> {
    return rhs - lhs
}

@infix public func -(c: Float, rhs: Expression<Edge>) -> Expression<Edge> {
    return Expression(rhs.value, rhs.coefficients.map { $0 - c})
}

@infix public func -(lhs: Expression<Edge>, rhs: Float) -> Expression<Edge> {
    return rhs - lhs
}
