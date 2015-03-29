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

public struct Edges: Compound, RelativeCompoundEquality, RelativeCompoundInequality {
    public let context: Context
    public let properties: [Property]

    internal init(_ context: Context, _ properties: [Property]) {
        self.context = context
        self.properties = properties
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
