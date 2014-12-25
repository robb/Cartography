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
    case Center(Context, View)

    var context: Context {
        switch (self) {
            case let .Center(context, _):
                return context
        }
    }

    var properties: [Property] {
        switch (self) {
            case let .Center(context, view):
                return [ Edge.CenterX(context, view), Edge.CenterY(context, view) ]
        }
    }
}

// MARK: Equality

public func ==(lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value)
}

public func ==(lhs: Expression<Point>, rhs: Point) -> [NSLayoutConstraint] {
    return rhs == lhs
}

public func ==(lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs)
}

// MARK: Inequality

public func <=(lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

public func >=(lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func <=(lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

public func <=(lhs: Expression<Point>, rhs: Point) -> [NSLayoutConstraint] {
    return rhs >= lhs
}

public func >=(lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func >=(lhs: Expression<Point>, rhs: Point) -> [NSLayoutConstraint] {
    return rhs <= lhs
}
