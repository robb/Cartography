//
//  LayoutProxy.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public struct LayoutProxy {
    /// The width of the view.
    public var width: Dimension {
        return Dimension(context, view, .Width)
    }

    /// The height of the view.
    public var height: Dimension {
        return Dimension(context, view, .Height)
    }

    /// The size of the view. This property affects both `width` and `height`.
    public var size: Size {
        return Size(context, [
            Dimension(context, view, .Width),
            Dimension(context, view, .Height)
        ])
    }

    /// The top edge of the view.
    public var top: Edge {
        return Edge(context, view, .Top)
    }

    /// The right edge of the view.
    public var right: Edge {
        return Edge(context, view, .Right)
    }

    /// The bottom edge of the view.
    public var bottom: Edge {
        return Edge(context, view, .Bottom)
    }

    /// The left edge of the view.
    public var left: Edge {
        return Edge(context, view, .Left)
    }

    /// All edges of the view. This property affects `top`, `bottom`, `leading`
    /// and `trailing`.
    public var edges: Edges {
        return Edges(context, [
            Edge(context, view, .Top),
            Edge(context, view, .Leading),
            Edge(context, view, .Bottom),
            Edge(context, view, .Trailing)
        ])
    }

    /// The leading edge of the view.
    public var leading: Edge {
        return Edge(context, view, .Leading)
    }

    /// The trailing edge of the view.
    public var trailing: Edge {
        return Edge(context, view, .Trailing)
    }

    /// The horizontal center of the view.
    public var centerX: Edge {
        return Edge(context, view, .CenterX)
    }

    /// The vertical center of the view.
    public var centerY: Edge {
        return Edge(context, view, .CenterY)
    }

    /// The center point of the view. This property affects `centerX` and
    /// `centerY`.
    public var center: Point {
        return Point(context, [
            Edge(context, view, .CenterX),
            Edge(context, view, .CenterY)
        ])
    }

    /// The baseline of the view.
    public var baseline: Edge {
        return Edge(context, view, .Baseline)
    }

    #if os(iOS)
    /// The first baseline of the view. iOS exclusive.
    @available(iOS, introduced=8.0)
    public var firstBaseline: Edge {
        return Edge(context, view, .FirstBaseline)
    }

    /// All edges of the view with their respective margins. This property
    /// affects `topMargin`, `bottomMargin`, `leadingMargin` and
    /// `trailingMargin`.
    @available(iOS, introduced=8.0)
    public var edgesWithinMargins: Edges {
        return Edges(context, [
            Edge(context, view, .TopMargin),
            Edge(context, view, .LeadingMargin),
            Edge(context, view, .BottomMargin),
            Edge(context, view, .TrailingMargin)
        ])
    }

    /// The left margin of the view. iOS exclusive.
    @available(iOS, introduced=8.0)
    public var leftMargin: Edge {
        return Edge(context, view, .LeftMargin)
    }

    /// The right margin of the view. iOS exclusive.
    @available(iOS, introduced=8.0)
    public var rightMargin: Edge {
        return Edge(context, view, .RightMargin)
    }

    /// The top margin of the view. iOS exclusive.
    @available(iOS, introduced=8.0)
    public var topMargin: Edge {
        return Edge(context, view, .TopMargin)
    }

    /// The bottom margin of the view. iOS exclusive.
    @available(iOS, introduced=8.0)
    public var bottomMargin: Edge {
        return Edge(context, view, .BottomMargin)
    }

    /// The leading margin of the view. iOS exclusive.
    @available(iOS, introduced=8.0)
    public var leadingMargin: Edge {
        return Edge(context, view, .LeadingMargin)
    }

    /// The trailing margin of the view. iOS exclusive.
    @available(iOS, introduced=8.0)
    public var trailingMargin: Edge {
        return Edge(context, view, .TrailingMargin)
    }

    /// The horizontal center within the margins of the view. iOS exclusive.
    @available(iOS, introduced=8.0)
    public var centerXWithinMargins: Edge {
        return Edge(context, view, .CenterXWithinMargins)
    }

    /// The vertical center within the margins of the view. iOS exclusive.
    @available(iOS, introduced=8.0)
    public var centerYWithinMargins: Edge {
        return Edge(context, view, .CenterYWithinMargins)
    }

    /// The center point within the margins of the view. This property affects
    /// `centerXWithinMargins` and `centerYWithinMargins`. iOS exclusive.
    @available(iOS, introduced=8.0)
    public var centerWithinMargins: Point {
        return Point(context, [
            Edge(context, view, .CenterXWithinMargins),
            Edge(context, view, .CenterYWithinMargins)
        ])
    }
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
    }
}
