//
//  Edge.swift
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

public enum Edge : Property {
    case Top(LayoutProxy)
    case Right(LayoutProxy)
    case Bottom(LayoutProxy)
    case Left(LayoutProxy)

    case Leading(LayoutProxy)
    case Trailing(LayoutProxy)

    case CenterX(LayoutProxy)
    case CenterY(LayoutProxy)

    case Baseline(LayoutProxy)

    public var attribute: NSLayoutAttribute {
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

    public var proxy: LayoutProxy {
        switch (self) {
            case let .Top(proxy): return proxy
            case let .Right(proxy): return proxy
            case let .Bottom(proxy): return proxy
            case let .Left(proxy): return proxy

            case let .Leading(proxy): return proxy
            case let .Trailing(proxy): return proxy

            case let .CenterX(proxy): return proxy
            case let .CenterY(proxy): return proxy

            case let .Baseline(proxy): return proxy
        }
    }

    public var view: View {
        return proxy.view
    }
}

// MARK: Inequality

public func <=(lhs: Edge, rhs: Edge) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

public func >=(lhs: Edge, rhs: Edge) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func <=(lhs: Edge, rhs: Expression<Edge>) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

public func <=(lhs: Expression<Edge>, rhs: Edge) -> NSLayoutConstraint {
    return rhs >= lhs
}

public func >=(lhs: Edge, rhs: Expression<Edge>) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func >=(lhs: Expression<Edge>, rhs: Edge) -> NSLayoutConstraint {
    return rhs <= lhs
}

// MARK: Addition

public func +(c: Float, rhs: Edge) -> Expression<Edge> {
    return Expression(rhs, [ Coefficients(1, c) ])
}

public func +(lhs: Edge, rhs: Float) -> Expression<Edge> {
    return rhs + lhs
}

public func +(c: Float, rhs: Expression<Edge>) -> Expression<Edge> {
    return Expression(rhs.value, rhs.coefficients.map { $0 + c })
}

public func +(lhs: Expression<Edge>, rhs: Float) -> Expression<Edge> {
    return rhs + lhs
}

// MARK: Subtraction

public func -(c: Float, rhs: Edge) -> Expression<Edge> {
    return Expression(rhs, [ Coefficients(1, -c) ])
}

public func -(lhs: Edge, rhs: Float) -> Expression<Edge> {
    return rhs - lhs
}

public func -(c: Float, rhs: Expression<Edge>) -> Expression<Edge> {
    return Expression(rhs.value, rhs.coefficients.map { $0 - c})
}

public func -(lhs: Expression<Edge>, rhs: Float) -> Expression<Edge> {
    return rhs - lhs
}

// MARK: Multiplication

public func *(m: Float, rhs: Expression<Edge>) -> Expression<Edge> {
    return Expression(rhs.value, rhs.coefficients.map { $0 * m })
}

public func *(lhs: Expression<Edge>, rhs: Float) -> Expression<Edge> {
    return rhs * lhs
}

public func *(m: Float, rhs: Edge) -> Expression<Edge> {
    return Expression(rhs, [ Coefficients(m, 0) ])
}

public func *(lhs: Edge, rhs: Float) -> Expression<Edge> {
    return rhs * lhs
}

// MARK: Division

public func /(m: Float, rhs: Expression<Edge>) -> Expression<Edge> {
    return Expression(rhs.value, rhs.coefficients.map { $0 / m })
}

public func /(lhs: Expression<Edge>, rhs: Float) -> Expression<Edge> {
    return rhs / lhs
}

public func /(m: Float, rhs: Edge) -> Expression<Edge> {
    return Expression(rhs, [ Coefficients(1 / m, 0) ])
}

public func /(lhs: Edge, rhs: Float) -> Expression<Edge> {
    return rhs / lhs
}
