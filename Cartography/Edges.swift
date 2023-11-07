//
//  Edges.swift
//  Cartography
//
//  Created by Robert Böhnke on 19/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit
#else
import AppKit
#endif

public struct Edges: Compound, RelativeCompoundEquality, RelativeCompoundInequality {
    public let context: Context
    public let properties: [Property]

    internal init(_ context: Context, _ properties: [Property]) {
        guard properties.count == 4 else {
            fatalError("No valid edges were used")
        }

        self.context = context
        self.properties = properties
    }

    /// Insets all edges individually.
    ///
    /// - parameter top:      The amount by which to inset the top edge, in points.
    /// - parameter leading:  The amount by which to inset the leading edge, in points.
    /// - parameter bottom:   The amount by which to inset the bottom edge, in points.
    /// - parameter trailing: The amount by which to inset the trailing edge, in points.
    ///
    /// - returns: A new expression with the inseted edges.
    ///
    public func inseted(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) -> Expression<Edges> {
        return Expression(
            self,
            [
                Coefficients(1, top),
                Coefficients(1, leading),
                Coefficients(1, -bottom),
                Coefficients(1, -trailing)
            ]
        )
    }

    /// Insets all horizontal and vertical edges.
    ///
    /// - parameter horizontally:   The amount by which to inset the leading and trailing edges, in points.
    /// - parameter vertically:     The amount by which to inset the top and bottom edges, in points.
    ///
    /// - returns: A new expression with the inseted edges.
    ///
    public func inseted(horizontally: CGFloat, vertically: CGFloat) -> Expression<Edges> {
        return self.inseted(
            top: vertically,
            leading: horizontally,
            bottom: vertically,
            trailing: horizontally
        )
    }

    /// Insets all horizontal edges.
    ///
    /// - parameter horizontally:   The amount by which to inset the leading and trailing edges, in points.
    ///
    /// - returns: A new expression with the inseted edges.
    ///
    public func inseted(horizontally: CGFloat) -> Expression<Edges> {
        return self.inseted(
            horizontally: horizontally,
            vertically: 0
        )
    }

    /// Insets all vertical edges.
    ///
    /// - parameter vertically: The amount by which to inset the top and bottom edges, in points.
    ///
    /// - returns: A new expression with the inseted edges.
    ///
    public func inseted(vertically: CGFloat) -> Expression<Edges> {
        return self.inseted(
            horizontally: 0,
            vertically: vertically
        )
    }

    /// Insets all edges by a single value.
    ///
    /// - parameter by: The amount by which to inset the top and bottom edges, in points.
    ///
    /// - returns: A new expression with the inseted edges.
    ///
    public func inseted(by value: CGFloat) -> Expression<Edges> {
        return self.inseted(
            horizontally: value,
            vertically: value
        )
    }

    #if os(iOS) || os(tvOS) || os(visionOS)
    /// Insets all edges individually using an existing UIEdgeInsets.
    ///
    /// - parameter by: The UIEdgeInsets to use as a base value.
    ///
    /// - returns: A new expression with the inseted edges.
    ///
    public func inseted(by insets: UIEdgeInsets) -> Expression<Edges> {
        return self.inseted(
            top: insets.top,
            leading: insets.left,
            bottom: insets.bottom,
            trailing: insets.right
        )
    }
    #endif
}

/// Insets all edges.
///
/// - parameter edges: The edges to inset.
/// - parameter all:   The amount by which to inset all edges, in points.
///
/// - returns: A new expression with the inset edges.
///
public func inset(_ edges: Edges, _ all: CGFloat) -> Expression<Edges> {
    return edges.inseted(by: all)
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
public func inset(_ edges: Edges, _ horizontal: CGFloat, _ vertical: CGFloat) -> Expression<Edges> {
    return edges.inseted(horizontally: horizontal, vertically: vertical)
}

/// Insets the horizontal edges.
///
/// - parameter edges:      The edges to inset.
/// - parameter horizontally: The amount by which to inset the horizontal edges, in
///                    points.
///
/// - returns: A new expression with the inset edges.
///
public func inset(_ edges: Edges, horizontally horizontal: CGFloat) -> Expression<Edges> {
    return edges.inseted(horizontally: horizontal)
}

/// Insets the vertical edges.
///
/// - parameter edges:      The edges to inset.
/// - parameter vertically: The amount by which to inset the vertical edges, in
///                    points.
///
/// - returns: A new expression with the inset edges.
///
public func inset(_ edges: Edges, vertically vertical: CGFloat) -> Expression<Edges> {
    return edges.inseted(vertically: vertical)
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
public func inset(_ edges: Edges, _ top: CGFloat, _ leading: CGFloat, _ bottom: CGFloat, _ trailing: CGFloat) -> Expression<Edges> {
    return edges.inseted(top: top, leading: leading, bottom: bottom, trailing: trailing)
}

#if os(iOS) || os(tvOS) || os(visionOS)
/// Insets edges individually with UIEdgeInset.
///
/// - parameter edges:    The edges to inset.
/// - parameter insets:   The amounts by which to inset all edges, in points via UIEdgeInsets.
///
/// - returns: A new expression with the inset edges.
///
public func inset(_ edges: Edges, _ insets: UIEdgeInsets) -> Expression<Edges> {
    return edges.inseted(by: insets)
}
#endif
