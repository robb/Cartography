//
//  Edges.swift
//  Cartography
//
//  Created by Robert Böhnke on 19/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public enum Edges : Compound {
    case Edges(View)

    var properties: [Property] {
        switch (self) {
            case let .Edges(view):
                return [
                    Edge.Top(view),
                    Edge.Leading(view),
                    Edge.Bottom(view),
                    Edge.Trailing(view)
                ]
        }
    }
}

public func inset(edges: Edges, all: Float) -> Expression<Edges> {
    return inset(edges, all, all, all, all)
}

public func inset(edges: Edges, horizontal: Float, vertical: Float) -> Expression<Edges> {
    return inset(edges, vertical, horizontal, vertical, horizontal)
}

public func inset(edges: Edges, top: Float, leading: Float, bottom: Float, trailing: Float) -> Expression<Edges> {
    return Expression(edges, [ Coefficients(1, top), Coefficients(1, leading), Coefficients(1, -bottom), Coefficients(1, -trailing) ])
}

// Equality

@infix public func ==(lhs: Edges, rhs: Expression<Edges>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value)
}

@infix public func ==(lhs: Expression<Edges>, rhs: Edges) -> [NSLayoutConstraint] {
    return rhs == lhs
}

@infix public func ==(lhs: Edges, rhs: Edges) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs)
}

// Inequality

@infix public func <=(lhs: Edges, rhs: Edges) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix public func >=(lhs: Edges, rhs: Edges) -> [NSLayoutConstraint] {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix public func <=(lhs: Edges, rhs: Expression<Edges>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix public func <=(lhs: Expression<Edges>, rhs: Edges) -> [NSLayoutConstraint] {
    return rhs >= lhs
}

@infix public func >=(lhs: Edges, rhs: Expression<Edges>) -> [NSLayoutConstraint] {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix public func >=(lhs: Expression<Edges>, rhs: Edges) -> [NSLayoutConstraint] {
    return rhs <= lhs
}
