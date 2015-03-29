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
    /// The first baseline of the view. iOS exclusive.
    public let firstBaseline: Edge

    /// The left margin of the view. iOS exclusive.
    public let leftMargin: Edge

    /// The right margin of the view. iOS exclusive.
    public let rightMargin: Edge

    /// The top margin of the view. iOS exclusive.
    public let topMargin: Edge

    /// The bottom margin of the view. iOS exclusive.
    public let bottomMargin: Edge

    /// The leading margin of the view. iOS exclusive.
    public let leadingMargin: Edge

    /// The trailing margin of the view. iOS exclusive.
    public let trailingMargin: Edge

    /// The horizontal center within the margins of the view. iOS exclusive.
    public let centerXWithinMargins: Edge

    /// The vertical center within the margins of the view. iOS exclusive.
    public let centerYWithinMargins: Edge

    /// The center point within the margins of the view. This property affects
    /// `centerXWithinMargins` and `centerYWithinMargins`. iOS exclusive.
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

        width  = Dimension(context, view, .Width)
        height = Dimension(context, view, .Height)

        size = Size(context, [
            Dimension(context, view, .Width),
            Dimension(context, view, .Height)
        ])

        top    = Edge(context, view, .Top)
        right  = Edge(context, view, .Right)
        bottom = Edge(context, view, .Bottom)
        left   = Edge(context, view, .Left)

        edges = Edges(context, [
            Edge(context, view, .Top),
            Edge(context, view, .Leading),
            Edge(context, view, .Bottom),
            Edge(context, view, .Trailing)
        ])

        leading = Edge(context, view, .Leading)
        trailing = Edge(context, view, .Trailing)

        centerX = Edge(context, view, .CenterX)
        centerY = Edge(context, view, .CenterY)

        center = Point(context, [
            Edge(context, view, .CenterX),
            Edge(context, view, .CenterY)
        ])

        baseline = Edge(context, view, .Baseline)

        #if os(iOS)
        firstBaseline = Edge(context, view, .FirstBaseline)

        leftMargin = Edge(context, view, .LeftMargin)
        rightMargin = Edge(context, view, .RightMargin)
        topMargin = Edge(context, view, .TopMargin)
        bottomMargin = Edge(context, view, .BottomMargin)
        leadingMargin = Edge(context, view, .LeadingMargin)
        trailingMargin = Edge(context, view, .TrailingMargin)
        centerXWithinMargins = Edge(context, view, .CenterXWithinMargins)
        centerYWithinMargins = Edge(context, view, .CenterYWithinMargins)

        centerWithinMargins = Point(context, [
            Edge(context, view, .CenterXWithinMargins),
            Edge(context, view, .CenterYWithinMargins)
        ])
        #endif
    }
}
