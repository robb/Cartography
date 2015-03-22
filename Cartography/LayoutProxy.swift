//
//  LayoutProxy.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public class LayoutProxy {
    /// The width of the view.
    public let width: Dimension

    /// The height of the view.
    public let height: Dimension

    /// The size of the view. This property affects both `width` and `height`.
    public let size: Size

    /// The top edge of the view.
    public let top: Edge

    /// The right edge of the view.
    public let right: Edge

    /// The bottom edge of the view.
    public let bottom: Edge

    /// The left edge of the view.
    public let left: Edge

    /// All edges of the view. This property affects `top`, `bottom`, `leading`
    /// and `trailing`.
    public let edges: Edges

    /// The leading edge of the view.
    public let leading: Edge

    /// The trailing edge of the view.
    public let trailing: Edge

    /// The horizontal center of the view.
    public let centerX: Edge

    /// The vertical center of the view.
    public let centerY: Edge

    /// The center point of the view. This property affects `centerX` and
    /// `centerY`.
    public let center: Point

    /// The baseline of the view.
    public let baseline: Edge

    #if os(iOS)
    public let firstBaseline: Edge

    /// The left margin of the view.
    public let leftMargin: Edge

    /// The right margin of the view.
    public let rightMargin: Edge

    /// The top margin of the view.
    public let topMargin: Edge

    /// The bottom margin of the view.
    public let bottomMargin: Edge

    /// The leading margin of the view.
    public let leadingMargin: Edge

    /// The trailing margin of the view.
    public let trailingMargin: Edge

    /// The horizontal center within the margins of the view.
    public let centerXWithinMargins: Edge

    /// The vertical center within the margins of the view.
    public let centerYWithinMargins: Edge

    /// The center point within the margins of the view. This property affects
    /// `centerXWithinMargins` and `centerYWithinMargins`.
    public let centerWithinMargins: Point
    #endif

    internal let context: Context
    internal let view: View

    /// The superview of the view, if it exists.
    public var superview: LayoutProxy? {
        if let superview = view.superview {
            return LayoutProxy(context, superview)
        } else {
            return nil
        }
    }

    init(_ context: Context, _ view: View) {
        self.context = context
        self.view = view

        width  = Dimension.Width(context, view)
        height = Dimension.Height(context, view)

        size = Size.Size(context, view)

        top    = Edge.Top(context, view)
        right  = Edge.Right(context, view)
        bottom = Edge.Bottom(context, view)
        left   = Edge.Left(context, view)

        edges = Edges.Edges(context, view)

        leading = Edge.Leading(context, view)
        trailing = Edge.Trailing(context, view)

        centerX = Edge.CenterX(context, view)
        centerY = Edge.CenterY(context, view)

        center = Point.Center(context, view)

        baseline = Edge.Baseline(context, view)

        #if os(iOS)
        firstBaseline = .FirstBaseline(context, view)

        leftMargin = .LeftMargin(context, view)
        rightMargin = .RightMargin(context, view)
        topMargin = .TopMargin(context, view)
        bottomMargin = .BottomMargin(context, view)
        leadingMargin = .LeadingMargin(context, view)
        trailingMargin = .TrailingMargin(context, view)
        centerXWithinMargins = .CenterXWithinMargins(context, view)
        centerYWithinMargins = .CenterYWithinMargins(context, view)

        centerWithinMargins = .CenterWithinMargins(context, view)
        #endif
    }
}
