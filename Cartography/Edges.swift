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

/// Insets all edges.
///
/// :param: edges The edges to inset.
/// :param: all   The amount by which to inset all edges, in points.
///
/// :returns: A new expression with the inset edges.
///
public func inset(edges: Edges, all: Number) -> Expression<Edges> {
    return inset(edges, all, all, all, all)
}

/// Insets the horizontal and vertical edges.
///
/// :param: edges      The edges to inset.
/// :param: horizontal The amount by which to inset the horizontal edges, in
///                    points.
/// :param: vertical   The amount by which to inset the vertical edges, in
///                    points.
///
/// :returns: A new expression with the inset edges.
///
public func inset(edges: Edges, horizontal: Number, vertical: Number) -> Expression<Edges> {
    return inset(edges, vertical, horizontal, vertical, horizontal)
}

/// Insets edges individually.
///
/// :param: edges    The edges to inset.
/// :param: top      The amount by which to inset the top edge, in points.
/// :param: leading  The amount by which to inset the leading edge, in points.
/// :param: bottom   The amount by which to inset the bottom edge, in points.
/// :param: trailing The amount by which to inset the trailing edge, in points.
///
/// :returns: A new expression with the inset edges.
///
public func inset(edges: Edges, top: Number, leading: Number, bottom: Number, trailing: Number) -> Expression<Edges> {
    return Expression(edges, [
        Coefficients(1, top.doubleValue),
        Coefficients(1, leading.doubleValue),
        Coefficients(1, -bottom.doubleValue),
        Coefficients(1, -trailing.doubleValue)
    ])
}

// MARK: Equality

/// Declares a property equal to the result of an expression.
///
/// :param: lhs The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// :param: rhs The expression.
///
/// :returns: An `NSLayoutConstraint`.
///
public func == (lhs: Edges, rhs: Expression<Edges>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value)
}

/// Declares a property equal to another property.
///
/// :param: lhs The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// :param: rhs The other property.
///
/// :returns: An `NSLayoutConstraint`.
///
public func == (lhs: Edges, rhs: Edges) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs)
}

// MARK: Inequality

/// Declares a property less than or equal to another property.
///
/// :param: lhs The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// :param: rhs The other property.
///
/// :returns: An `NSLayoutConstraint`.
///
public func <= (lhs: Edges, rhs: Edges) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

/// Declares a property greater than or equal to another property.
///
/// :param: lhs The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// :param: rhs The other property.
///
/// :returns: An `NSLayoutConstraint`.
///
public func >= (lhs: Edges, rhs: Edges) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

/// Declares a property less than or equal to the result of an expression.
///
/// :param: lhs The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// :param: rhs The expression.
///
/// :returns: An `NSLayoutConstraint`.
///
public func <= (lhs: Edges, rhs: Expression<Edges>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

/// Declares a property greater than or equal to the result of an expression.
///
/// :param: lhs The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// :param: rhs The expression.
///
/// :returns: An `NSLayoutConstraint`.
///
public func >= (lhs: Edges, rhs: Expression<Edges>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}
