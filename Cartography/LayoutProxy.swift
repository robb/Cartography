//
//  LayoutProxy.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

public protocol LayoutProxy: class {
    var context: Context { get }
    var item: AnyObject { get } //type-erased Layoutitem
}

extension LayoutProxy {
    #if os(iOS) || os(tvOS) || os(visionOS)
    internal func dimension(with attribute: NSLayoutConstraint.Attribute) -> Dimension {
        return Dimension(context, item, attribute)
    }

    internal func edge(with attribute: NSLayoutConstraint.Attribute) -> Edge {
        return Edge(context, item, attribute)
    }
    #elseif os(OSX)
    internal func dimension(with attribute: NSLayoutConstraint.Attribute) -> Dimension {
        return Dimension(context, item, attribute)
    }

    internal func edge(with attribute: NSLayoutConstraint.Attribute) -> Edge {
        return Edge(context, item, attribute)
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
    /// The top edge of the item.
    public var top: Edge {
        return edge(with: .top)
    }

    #if os(iOS) || os(tvOS) || os(visionOS)
    /// The top margin of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var topMargin: Edge {
        return edge(with: .topMargin)
    }
    #endif
}

public protocol SupportsBottomLayoutProxy: LayoutProxy {}
extension SupportsBottomLayoutProxy {
    /// The bottom edge of the item.
    public var bottom: Edge {
        return edge(with: .bottom)
    }

    #if os(iOS) || os(tvOS) || os(visionOS)
    /// The bottom margin of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var bottomMargin: Edge {
        return edge(with: .bottomMargin)
    }
    #endif
}

public protocol SupportsRightLayoutProxy: LayoutProxy {}
extension SupportsRightLayoutProxy {
    /// The right edge of the item.
    public var right: Edge {
        return edge(with: .right)
    }

    #if os(iOS) || os(tvOS) || os(visionOS)
    /// The right margin of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var rightMargin: Edge {
        return edge(with: .rightMargin)
    }
    #endif
}

public protocol SupportsLeftLayoutProxy: LayoutProxy {}
extension SupportsLeftLayoutProxy {
    /// The left edge of the item.
    public var left: Edge {
        return edge(with: .left)
    }

    #if os(iOS) || os(tvOS) || os(visionOS)
    /// The left margin of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var leftMargin: Edge {
        return edge(with: .leftMargin)
    }
    #endif
}

public protocol SupportsLeadingLayoutProxy: LayoutProxy {}
extension SupportsLeadingLayoutProxy {
    /// The leading edge of the item.
    public var leading: Edge {
        return edge(with: .leading)
    }

    #if os(iOS) || os(tvOS) || os(visionOS)
    /// The leading margin of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var leadingMargin: Edge {
        return edge(with: .leadingMargin)
    }
    #endif
}

public protocol SupportsTrailingLayoutProxy: LayoutProxy {}
extension SupportsTrailingLayoutProxy {
    /// The trailing edge of the item.
    public var trailing: Edge {
        return edge(with: .trailing)
    }

    #if os(iOS) || os(tvOS) || os(visionOS)
    /// The trailing margin of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var trailingMargin: Edge {
        return edge(with: .trailingMargin)
    }
    #endif
}

public protocol SupportsEdgesLayoutProxy: SupportsTopLayoutProxy, SupportsBottomLayoutProxy, SupportsLeadingLayoutProxy, SupportsTrailingLayoutProxy, SupportsLeftLayoutProxy, SupportsRightLayoutProxy {}
extension SupportsEdgesLayoutProxy {
    /// All edges of the item. This property affects `top`, `bottom`, `leading`
    /// and `trailing`.
    public var edges: Edges {
        return edges(for: top, leading, bottom, trailing)
    }

    #if os(iOS) || os(tvOS) || os(visionOS)
    /// All edges of the item with their respective margins. This property
    /// affects `topMargin`, `bottomMargin`, `leadingMargin` and
    /// `trailingMargin`.
    @available(iOS, introduced: 8.0)
    public var edgesWithinMargins: Edges {
        return edges(for: topMargin, leadingMargin, bottomMargin, trailingMargin)
    }
    #endif
}

public protocol SupportsCenterXLayoutProxy: LayoutProxy {}
extension SupportsCenterXLayoutProxy {
    /// The horizontal center of the item.
    public var centerX: Edge {
        return edge(with: .centerX)
    }

    #if os(iOS) || os(tvOS) || os(visionOS)
    /// The horizontal center within the margins of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerXWithinMargins: Edge {
        return edge(with: .centerXWithinMargins)
    }
    #endif
}

public protocol SupportsCenterYLayoutProxy: LayoutProxy {}
extension SupportsCenterYLayoutProxy {
    /// The vertical center of the item.
    public var centerY: Edge {
        return edge(with: .centerY)
    }

    #if os(iOS) || os(tvOS) || os(visionOS)
    /// The vertical center within the margins of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerYWithinMargins: Edge {
        return edge(with: .centerYWithinMargins)
    }
    #endif
}

public protocol SupportsCenteringLayoutProxy: SupportsCenterXLayoutProxy, SupportsCenterYLayoutProxy {}
extension SupportsCenteringLayoutProxy {
    /// The center point of the item. This property affects `centerX` and
    /// `centerY`.
    public var center: Point {
        return point(for: centerX, centerY)
    }

    #if os(iOS) || os(tvOS) || os(visionOS)
    /// The center point within the margins of the item. This property affects
    /// `centerXWithinMargins` and `centerYWithinMargins`. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerWithinMargins: Point {
        return point(for: centerXWithinMargins, centerYWithinMargins)
    }
    #endif
}

public protocol SupportsWidthLayoutProxy: LayoutProxy {}
extension SupportsWidthLayoutProxy {
    /// The width of the item.
    public var width: Dimension {
        return dimension(with: .width)
    }
}

public protocol SupportsHeightLayoutProxy: LayoutProxy {}
extension SupportsHeightLayoutProxy {
    /// The height of the item.
    public var height: Dimension {
        return dimension(with: .height)
    }
}

public protocol SupportsSizeLayoutProxy: SupportsWidthLayoutProxy, SupportsHeightLayoutProxy {}
extension SupportsSizeLayoutProxy {
    /// The size of the item. This property affects both `width` and `height`.
    public var size: Size {
        return size(for: width, height)
    }
}

public protocol SupportsBaselineLayoutProxy: LayoutProxy {}
extension SupportsBaselineLayoutProxy {
    /// The last baseline of the item.
    public var lastBaseline: Edge {
        return edge(with: .lastBaseline)
    }

    /// The baseline of the item.
    public var baseline: Edge {
        return edge(with: .lastBaseline)
    }

    /// The first baseline of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    @available(OSX, introduced: 10.11)
    public var firstBaseline: Edge {
        return edge(with: .firstBaseline)
    }
}

public protocol SupportsPositioningLayoutProxy: SupportsEdgesLayoutProxy, SupportsSizeLayoutProxy, SupportsCenteringLayoutProxy {}
