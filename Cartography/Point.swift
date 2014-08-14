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
    case Center(View)

    var properties: [Property] {
        switch (self) {
            case let .Center(view):
                return [ Edge.CenterX(view), Edge.CenterY(view) ]
        }
    }
}

// MARK: Equality

public func ==(lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value)
}

public func ==(lhs: Expression<Point>, rhs: Point) -> [NSLayoutConstraint] {
    return rhs == lhs
}

public func ==(lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs)
}

// MARK: Inequality

public func <=(lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

public func >=(lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func <=(lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

public func <=(lhs: Expression<Point>, rhs: Point) -> [NSLayoutConstraint] {
    return rhs >= lhs
}

public func >=(lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func >=(lhs: Expression<Point>, rhs: Point) -> [NSLayoutConstraint] {
    return rhs <= lhs
}
