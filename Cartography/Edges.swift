//
//  Edges.swift
//  Cartography
//
//  Created by Robert Böhnke on 19/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

public enum Edges : Compound {
    case Edges(Context, View)

    var context: Context {
        switch (self) {
            case let .Edges(context, _):
                return context
        }
    }

    var properties: [Property] {
        switch (self) {
            case let .Edges(context, view):
                return [
                    Edge.Top(context, view),
                    Edge.Leading(context, view),
                    Edge.Bottom(context, view),
                    Edge.Trailing(context, view)
                ]
        }
    }
}

public func inset(edges: Edges, all: Number) -> Expression<Edges> {
    return inset(edges, all, all, all, all)
}

public func inset(edges: Edges, horizontal: Number, vertical: Number) -> Expression<Edges> {
    return inset(edges, vertical, horizontal, vertical, horizontal)
}

public func inset(edges: Edges, top: Number, leading: Number, bottom: Number, trailing: Number) -> Expression<Edges> {
    return Expression(edges, [
        Coefficients(1, top.doubleValue),
        Coefficients(1, leading.doubleValue),
        Coefficients(1, -bottom.doubleValue),
        Coefficients(1, -trailing.doubleValue)
    ])
}

// MARK: Equality

public func ==(lhs: Edges, rhs: Expression<Edges>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value)
}

public func ==(lhs: Expression<Edges>, rhs: Edges) -> [NSLayoutConstraint] {
    return rhs == lhs
}

public func ==(lhs: Edges, rhs: Edges) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs)
}

// MARK: Inequality

public func <=(lhs: Edges, rhs: Edges) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

public func >=(lhs: Edges, rhs: Edges) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func <=(lhs: Edges, rhs: Expression<Edges>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

public func <=(lhs: Expression<Edges>, rhs: Edges) -> [NSLayoutConstraint] {
    return rhs >= lhs
}

public func >=(lhs: Edges, rhs: Expression<Edges>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func >=(lhs: Expression<Edges>, rhs: Edges) -> [NSLayoutConstraint] {
    return rhs <= lhs
}
