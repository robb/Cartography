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
        return Dimension(context, view, .width, needsSafeArea)
    }

    /// The height of the view.
    public var height: Dimension {
        return Dimension(context, view, .height, needsSafeArea)
    }

    /// The size of the view. This property affects both `width` and `height`.
    public var size: Size {
        return Size(context, [
            Dimension(context, view, .width, needsSafeArea),
            Dimension(context, view, .height, needsSafeArea)
        ])
    }

    /// The top edge of the view.
    public var top: Edge {
        return Edge(context, view, .top, needsSafeArea)
    }

    /// The right edge of the view.
    public var right: Edge {
        return Edge(context, view, .right, needsSafeArea)
    }

    /// The bottom edge of the view.
    public var bottom: Edge {
        return Edge(context, view, .bottom, needsSafeArea)
    }

    /// The left edge of the view.
    public var left: Edge {
        return Edge(context, view, .left, needsSafeArea)
    }

    /// All edges of the view. This property affects `top`, `bottom`, `leading`
    /// and `trailing`.
    public var edges: Edges {
        return Edges(context, [
            Edge(context, view, .top, needsSafeArea),
            Edge(context, view, .leading, needsSafeArea),
            Edge(context, view, .bottom, needsSafeArea),
            Edge(context, view, .trailing, needsSafeArea)
        ])
    }

    /// The leading edge of the view.
    public var leading: Edge {
        return Edge(context, view, .leading, needsSafeArea)
    }

    /// The trailing edge of the view.
    public var trailing: Edge {
        return Edge(context, view, .trailing, needsSafeArea)
    }

    /// The horizontal center of the view.
    public var centerX: Edge {
        return Edge(context, view, .centerX, needsSafeArea)
    }

    /// The vertical center of the view.
    public var centerY: Edge {
        return Edge(context, view, .centerY, needsSafeArea)
    }

    /// The center point of the view. This property affects `centerX` and
    /// `centerY`.
    public var center: Point {
        return Point(context, [
            Edge(context, view, .centerX, needsSafeArea),
            Edge(context, view, .centerY, needsSafeArea)
        ])
    }

    /// The baseline of the view.
    public var baseline: Edge {
        return Edge(context, view, .lastBaseline, needsSafeArea)
    }

    /// The last baseline of the view.
    public var lastBaseline: Edge {
        return Edge(context, view, .lastBaseline, needsSafeArea)
    }
    
    #if os(iOS) || os(tvOS)
    /// The first baseline of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var firstBaseline: Edge {
        return Edge(context, view, .firstBaseline, needsSafeArea)
    }

    /// All edges of the view with their respective margins. This property
    /// affects `topMargin`, `bottomMargin`, `leadingMargin` and
    /// `trailingMargin`.
    @available(iOS, introduced: 8.0)
    public var edgesWithinMargins: Edges {
        return Edges(context, [
            Edge(context, view, .topMargin, needsSafeArea),
            Edge(context, view, .leadingMargin, needsSafeArea),
            Edge(context, view, .bottomMargin, needsSafeArea),
            Edge(context, view, .trailingMargin, needsSafeArea)
        ])
    }

    /// The left margin of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var leftMargin: Edge {
        return Edge(context, view, .leftMargin, needsSafeArea)
    }

    /// The right margin of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var rightMargin: Edge {
        return Edge(context, view, .rightMargin, needsSafeArea)
    }

    /// The top margin of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var topMargin: Edge {
        return Edge(context, view, .topMargin, needsSafeArea)
    }

    /// The bottom margin of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var bottomMargin: Edge {
        return Edge(context, view, .bottomMargin, needsSafeArea)
    }

    /// The leading margin of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var leadingMargin: Edge {
        return Edge(context, view, .leadingMargin, needsSafeArea)
    }

    /// The trailing margin of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var trailingMargin: Edge {
        return Edge(context, view, .trailingMargin, needsSafeArea)
    }

    /// The horizontal center within the margins of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerXWithinMargins: Edge {
        return Edge(context, view, .centerXWithinMargins, needsSafeArea)
    }

    /// The vertical center within the margins of the view. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerYWithinMargins: Edge {
        return Edge(context, view, .centerYWithinMargins, needsSafeArea)
    }

    /// The center point within the margins of the view. This property affects
    /// `centerXWithinMargins` and `centerYWithinMargins`. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerWithinMargins: Point {
        return Point(context, [
            Edge(context, view, .centerXWithinMargins, needsSafeArea),
            Edge(context, view, .centerYWithinMargins, needsSafeArea)
        ])
    }
    #endif

    internal let context: Context

    internal let view: View

    private let needsSafeArea: Bool

    /// The superview of the view, if it exists.
    public var superview: LayoutProxy? {
        if let superview = view.superview {
            return LayoutProxy(context, superview)
        } else {
            return nil
        }
    }

    #if os(iOS) || os(tvOS)
    /// The safeArea of the view.
    @available(iOS, introduced: 11.0)
    public var safeArea: LayoutProxy {
        return LayoutProxy(context, view, true)
    }
    #endif

    init(_ context: Context, _ view: View, _ needsSafeArea: Bool = false) {
        self.context = context
        self.view = view
        self.needsSafeArea = needsSafeArea
    }
}
