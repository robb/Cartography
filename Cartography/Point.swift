//
//  Point.swift
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

public enum Point : Compound {
    case Center(LayoutProxy)

    var properties: [Property] {
        switch (self) {
            case let .Center(proxy):
                return [ Edge.CenterX(proxy), Edge.CenterY(proxy) ]
        }
    }

    var proxy: LayoutProxy {
        switch (self) {
            case let .Center(proxy):
                return proxy
        }
    }
}

// MARK: Equality

public func ==(lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return lhs.proxy.apply(lhs, coefficients: rhs.coefficients, to: rhs.value)
}

public func ==(lhs: Expression<Point>, rhs: Point) -> [NSLayoutConstraint] {
    return rhs == lhs
}

public func ==(lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return lhs.proxy.apply(lhs, to: rhs)
}

// MARK: Inequality

public func <=(lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return lhs.proxy.apply(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

public func >=(lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return lhs.proxy.apply(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func <=(lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return lhs.proxy.apply(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

public func <=(lhs: Expression<Point>, rhs: Point) -> [NSLayoutConstraint] {
    return rhs >= lhs
}

public func >=(lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return lhs.proxy.apply(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func >=(lhs: Expression<Point>, rhs: Point) -> [NSLayoutConstraint] {
    return rhs <= lhs
}
