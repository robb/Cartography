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
/// - parameter edges: The edges to inset.
/// - parameter all:   The amount by which to inset all edges, in points.
///
/// - returns: A new expression with the inset edges.
///
public func inset(edges: Edges, _ all: CGFloat) -> Expression<Edges> {
    return inset(edges, all, all, all, all)
}

/// Insets the horizontal and vertical edges.
///
/// - parameter edges:      The edges to inset.
/// - parameter horizontal: The amount by which to inset the horizontal edges, in
///                    points.
/// - parameter vertical:   The amount by which to inset the vertical edges, in
///                    points.
///
/// - returns: A new expression with the inset edges.
///
public func inset(edges: Edges, _ horizontal: CGFloat, _ vertical: CGFloat) -> Expression<Edges> {
    return inset(edges, vertical, horizontal, vertical, horizontal)
}

/// Insets edges individually.
///
/// - parameter edges:    The edges to inset.
/// - parameter top:      The amount by which to inset the top edge, in points.
/// - parameter leading:  The amount by which to inset the leading edge, in points.
/// - parameter bottom:   The amount by which to inset the bottom edge, in points.
/// - parameter trailing: The amount by which to inset the trailing edge, in points.
///
/// - returns: A new expression with the inset edges.
///
public func inset(edges: Edges, _ top: CGFloat, _ leading: CGFloat, _ bottom: CGFloat, _ trailing: CGFloat) -> Expression<Edges> {
    return Expression(edges, [
        Coefficients(1, top),
        Coefficients(1, leading),
        Coefficients(1, -bottom),
        Coefficients(1, -trailing)
    ])
}
