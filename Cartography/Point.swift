//
//  Point.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public enum Point : Compound {
    case Center(View)

    var properties: [Property] {
        switch (self) {
            case let .Center(view):
                return [ Edge.CenterX(view), Edge.CenterY(view) ]
        }
    }
}

// Equality

@infix public func ==(lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value)
}

@infix public func ==(lhs: Expression<Point>, rhs: Point) -> [NSLayoutConstraint] {
    return rhs == lhs
}

@infix public func ==(lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs)
}

// Inequality

@infix public func <=(lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix public func >=(lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix public func <=(lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix public func <=(lhs: Expression<Point>, rhs: Point) -> [NSLayoutConstraint] {
    return rhs >= lhs
}

@infix public func >=(lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix public func >=(lhs: Expression<Point>, rhs: Point) -> [NSLayoutConstraint] {
    return rhs <= lhs
}
