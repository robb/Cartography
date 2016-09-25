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
        return Dimension(context, view, .width)
    }

    /// The height of the view.
    public var height: Dimension {
        return Dimension(context, view, .height)
    }

    /// The size of the view. This property affects both `width` and `height`.
    public var size: Size {
        return Size(context, [
            Dimension(context, view, .width),
            Dimension(context, view, .height)
        ])
    }

    /// The top edge of the view.
    public var top: Edge {
        return Edge(context, view, .top)
    }

    /// The right edge of the view.
    public var right: Edge {
        return Edge(context, view, .right)
    }

    /// The bottom edge of the view.
    public var bottom: Edge {
        return Edge(context, view, .bottom)
    }

    /// The left edge of the view.
    public var left: Edge {
        return Edge(context, view, .left)
    }

    /// All edges of the view. This property affects `top`, `bottom`, `leading`
    /// and `trailing`.
    public var edges: Edges {
        return Edges(context, [
            Edge(context, view, .top),
            Edge(context, view, .leading),
            Edge(context, view, .bottom),
            Edge(context, view, .trailing)
        ])
    }

    /// The leading edge of the view.
    public var leading: Edge {
        return Edge(context, view, .leading)
    }

    /// The trailing edge of the view.
    public var trailing: Edge {
        return Edge(context, view, .trailing)
    }

    /// The horizontal center of the view.
    public var centerX: Edge {
        return Edge(context, view, .centerX)
    }

    /// The vertical center of the view.
    public var centerY: Edge {
        return Edge(context, view, .centerY)
    }

    /// The center point of the view. This property affects `centerX` and
    /// `centerY`.
    public var center: Point {
        return Point(context, [
            Edge(context, view, .centerX),
            Edge(context, view, .centerY)
        ])
    }

    /// The baseline of the view.
    public var baseline: Edge {
        return Edge(context, view, .lastBaseline)
    }

    /// The last baseline of the view.
    public var lastBaseline: Edge {
        return Edge(context, view, .lastBaseline)
    }
    
    #if os(iOS) || os(tvOS)
    /// The first baseline of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var firstBaseline: Edge {
        return Edge(context, view, .firstBaseline)
    }

    /// All edges of the view with their respective margins. This property
    /// affects `topMargin`, `bottomMargin`, `leadingMargin` and
    /// `trailingMargin`.
    @available(iOS, introduced: 8.0)
    public var edgesWithinMargins: Edges {
        return Edges(context, [
            Edge(context, view, .topMargin),
            Edge(context, view, .leadingMargin),
            Edge(context, view, .bottomMargin),
            Edge(context, view, .trailingMargin)
        ])
    }

    /// The left margin of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var leftMargin: Edge {
        return Edge(context, view, .leftMargin)
    }

    /// The right margin of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var rightMargin: Edge {
        return Edge(context, view, .rightMargin)
    }

    /// The top margin of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var topMargin: Edge {
        return Edge(context, view, .topMargin)
    }

    /// The bottom margin of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var bottomMargin: Edge {
        return Edge(context, view, .bottomMargin)
    }

    /// The leading margin of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var leadingMargin: Edge {
        return Edge(context, view, .leadingMargin)
    }

    /// The trailing margin of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var trailingMargin: Edge {
        return Edge(context, view, .trailingMargin)
    }

    /// The horizontal center within the margins of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerXWithinMargins: Edge {
        return Edge(context, view, .centerXWithinMargins)
    }

    /// The vertical center within the margins of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerYWithinMargins: Edge {
        return Edge(context, view, .centerYWithinMargins)
    }

    /// The center point within the margins of the view. This property affects
    /// `centerXWithinMargins` and `centerYWithinMargins`. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerWithinMargins: Point {
        return Point(context, [
            Edge(context, view, .centerXWithinMargins),
            Edge(context, view, .centerYWithinMargins)
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
