//
//  LayoutProxy.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public protocol LayoutProxy {
    var context: Context { get }
    var element: AnyObject { get } //type-erased LayoutElement
}

extension LayoutProxy {
    #if os(iOS) || os(tvOS)
    internal func dimension(with attribute: NSLayoutAttribute) -> Dimension {
        return Dimension(context, element, attribute)
    }

    internal func edge(with attribute: NSLayoutAttribute) -> Edge {
        return Edge(context, element, attribute)
    }
    #elseif os(OSX)
    internal func dimension(with attribute: NSLayoutConstraint.Attribute) -> Dimension {
        return Dimension(context, element, attribute)
    }

    internal func edge(with attribute: NSLayoutConstraint.Attribute) -> Edge {
        return Edge(context, element, attribute)
    }
    #endif

    internal func point(for attr1: Edge, _ attr2: Edge) -> Point {
        return Point(context, [attr1, attr2])
    }

    internal func size(for attr1: Dimension, _ attr2: Dimension) -> Size {
        return Size(context, [attr1, attr2])
    }

    internal func edges(for attr1: Edge, _ attr2: Edge, _ attr3: Edge, _ attr4: Edge) -> Edges {
        return Edges(context, [attr1, attr2, attr3, attr4])
    }
}

public protocol SupportsTopLayoutProxy: LayoutProxy {}
extension SupportsTopLayoutProxy {
    /// The top edge of the element.
    public var top: Edge {
        return edge(with: .top)
    }

    #if os(iOS) || os(tvOS)
    /// The top margin of the element. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var topMargin: Edge {
        return edge(with: .topMargin)
    }
    #endif
}

public protocol SupportsBottomLayoutProxy: LayoutProxy {}
extension SupportsBottomLayoutProxy {
    /// The bottom edge of the element.
    public var bottom: Edge {
        return edge(with: .bottom)
    }

    #if os(iOS) || os(tvOS)
    /// The bottom margin of the element. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var bottomMargin: Edge {
        return edge(with: .bottomMargin)
    }
    #endif
}

public protocol SupportsRightLayoutProxy: LayoutProxy {}
extension SupportsRightLayoutProxy {
    /// The right edge of the element.
    public var right: Edge {
        return edge(with: .right)
    }

    #if os(iOS) || os(tvOS)
    /// The right margin of the element. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var rightMargin: Edge {
        return edge(with: .rightMargin)
    }
    #endif
}

public protocol SupportsLeftLayoutProxy: LayoutProxy {}
extension SupportsLeftLayoutProxy {
    /// The left edge of the element.
    public var left: Edge {
        return edge(with: .left)
    }

    #if os(iOS) || os(tvOS)
    /// The left margin of the element. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var leftMargin: Edge {
        return edge(with: .leftMargin)
    }
    #endif
}

public protocol SupportsLeadingLayoutProxy: LayoutProxy {}
extension SupportsLeadingLayoutProxy {
    /// The leading edge of the element.
    public var leading: Edge {
        return edge(with: .leading)
    }

    #if os(iOS) || os(tvOS)
    /// The leading margin of the element. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var leadingMargin: Edge {
        return edge(with: .leadingMargin)
    }
    #endif
}

public protocol SupportsTrailingLayoutProxy: LayoutProxy {}
extension SupportsTrailingLayoutProxy {
    /// The trailing edge of the element.
    public var trailing: Edge {
        return edge(with: .trailing)
    }

    #if os(iOS) || os(tvOS)
    /// The trailing margin of the element. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var trailingMargin: Edge {
        return edge(with: .trailingMargin)
    }
    #endif
}

public protocol SupportsEdgesLayoutProxy: SupportsTopLayoutProxy, SupportsBottomLayoutProxy, SupportsLeadingLayoutProxy, SupportsTrailingLayoutProxy, SupportsLeftLayoutProxy, SupportsRightLayoutProxy {}
extension SupportsEdgesLayoutProxy {
    /// All edges of the element. This property affects `top`, `bottom`, `leading`
    /// and `trailing`.
    public var edges: Edges {
        return edges(for: top, leading, bottom, trailing)
    }

    #if os(iOS) || os(tvOS)
    /// All edges of the element with their respective margins. This property
    /// affects `topMargin`, `bottomMargin`, `leadingMargin` and
    /// `trailingMargin`.
    @available(iOS, introduced: 8.0)
    public var edgesWithinMargins: Edges {
        return edges(for: topMargin, leadingMargin, bottomMargin, trailingMargin)
    }
    #endif
}

public protocol SupportsCenteringLayoutProxy: LayoutProxy {}
extension SupportsCenteringLayoutProxy {
    /// The horizontal center of the element.
    public var centerX: Edge {
        return edge(with: .centerX)
    }

    /// The vertical center of the element.
    public var centerY: Edge {
        return edge(with: .centerY)
    }

    /// The center point of the element. This property affects `centerX` and
    /// `centerY`.
    public var center: Point {
        return point(for: centerX, centerY)
    }

    #if os(iOS) || os(tvOS)
    /// The horizontal center within the margins of the element. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerXWithinMargins: Edge {
        return edge(with: .centerXWithinMargins)
    }

    /// The vertical center within the margins of the element. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerYWithinMargins: Edge {
        return edge(with: .centerYWithinMargins)
    }

    /// The center point within the margins of the element. This property affects
    /// `centerXWithinMargins` and `centerYWithinMargins`. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerWithinMargins: Point {
        return point(for: centerXWithinMargins, centerYWithinMargins)
    }
    #endif
}

public protocol SupportsWidthLayoutProxy: LayoutProxy {}
extension SupportsWidthLayoutProxy {
    /// The width of the element.
    public var width: Dimension {
        return dimension(with: .width)
    }
}

public protocol SupportsHeightLayoutProxy: LayoutProxy {}
extension SupportsHeightLayoutProxy {
    /// The height of the element.
    public var height: Dimension {
        return dimension(with: .height)
    }
}

public protocol SupportsSizeLayoutProxy: SupportsWidthLayoutProxy, SupportsHeightLayoutProxy {}
extension SupportsSizeLayoutProxy {
    /// The size of the element. This property affects both `width` and `height`.
    public var size: Size {
        return size(for: width, height)
    }
}

public protocol SupportsBaselineLayoutProxy: LayoutProxy {}
extension SupportsBaselineLayoutProxy {
    /// The last baseline of the element.
    public var lastBaseline: Edge {
        return edge(with: .lastBaseline)
    }

    /// The baseline of the element.
    public var baseline: Edge {
        return edge(with: .lastBaseline)
    }

    /// The first baseline of the element. iOS exclusive.
    @available(iOS, introduced: 8.0)
    @available(OSX, introduced: 10.11)
    public var firstBaseline: Edge {
        return edge(with: .firstBaseline)
    }
}

public protocol SupportsPositioningLayoutProxy: SupportsEdgesLayoutProxy, SupportsBaselineLayoutProxy, SupportsSizeLayoutProxy, SupportsCenteringLayoutProxy {}
