//
//  LayoutProxy.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

public protocol LayoutProxy: class {
    var context: Context { get }
    var item: AnyObject { get } //type-erased Layoutitem
}

extension LayoutProxy {
    #if os(iOS) || os(tvOS)
    internal func dimension(with attribute: NSLayoutConstraint.Attribute) -> Dimension {
        return Dimension(context, item, attribute)
    }

    internal func xEdge(with attribute: NSLayoutConstraint.Attribute) -> EdgeXAxis {
        return EdgeXAxis(context, item, attribute)
    }
    
    internal func yEdge(with attribute: NSLayoutConstraint.Attribute) -> EdgeYAxis {
        return EdgeYAxis(context, item, attribute)
    }
    #elseif os(OSX)
    internal func dimension(with attribute: NSLayoutConstraint.Attribute) -> Dimension {
        return Dimension(context, item, attribute)
    }

    internal func xEdge(with attribute: NSLayoutConstraint.Attribute) -> EdgeXAxis {
        return EdgeXAxis(context, item, attribute)
    }
    
    internal func yEdge(with attribute: NSLayoutConstraint.Attribute) -> EdgeYAxis {
        return EdgeYAxis(context, item, attribute)
    }
    #endif

    internal func point(for attr1: EdgeXAxis, _ attr2: EdgeYAxis) -> Point {
        return Point(context, [attr1, attr2])
    }

    internal func size(for attr1: Dimension, _ attr2: Dimension) -> Size {
        return Size(context, [attr1, attr2])
    }

    internal func edges(for attr1: EdgeYAxis, _ attr2: EdgeXAxis, _ attr3: EdgeYAxis, _ attr4: EdgeXAxis) -> Edges {
        return Edges(context, [attr1, attr2, attr3, attr4])
    }
}

public protocol SupportsTopLayoutProxy: LayoutProxy {}
extension SupportsTopLayoutProxy {
    /// The top edge of the item.
    public var top: EdgeYAxis {
        return yEdge(with: .top)
    }

    #if os(iOS) || os(tvOS)
    /// The top margin of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var topMargin: EdgeYAxis {
        return yEdge(with: .topMargin)
    }
    #endif
}

public protocol SupportsBottomLayoutProxy: LayoutProxy {}
extension SupportsBottomLayoutProxy {
    /// The bottom edge of the item.
    public var bottom: EdgeYAxis {
        return yEdge(with: .bottom)
    }

    #if os(iOS) || os(tvOS)
    /// The bottom margin of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var bottomMargin: EdgeYAxis {
        return yEdge(with: .bottomMargin)
    }
    #endif
}

public protocol SupportsRightLayoutProxy: LayoutProxy {}
extension SupportsRightLayoutProxy {
    /// The right edge of the item.
    public var right: EdgeXAxis {
        return xEdge(with: .right)
    }

    #if os(iOS) || os(tvOS)
    /// The right margin of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var rightMargin: EdgeXAxis {
        return xEdge(with: .rightMargin)
    }
    #endif
}

public protocol SupportsLeftLayoutProxy: LayoutProxy {}
extension SupportsLeftLayoutProxy {
    /// The left edge of the item.
    public var left: EdgeXAxis {
        return xEdge(with: .left)
    }

    #if os(iOS) || os(tvOS)
    /// The left margin of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var leftMargin: EdgeXAxis {
        return xEdge(with: .leftMargin)
    }
    #endif
}

public protocol SupportsLeadingLayoutProxy: LayoutProxy {}
extension SupportsLeadingLayoutProxy {
    /// The leading edge of the item.
    public var leading: EdgeXAxis {
        return xEdge(with: .leading)
    }

    #if os(iOS) || os(tvOS)
    /// The leading margin of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var leadingMargin: EdgeXAxis {
        return xEdge(with: .leadingMargin)
    }
    #endif
}

public protocol SupportsTrailingLayoutProxy: LayoutProxy {}
extension SupportsTrailingLayoutProxy {
    /// The trailing edge of the item.
    public var trailing: EdgeXAxis {
        return xEdge(with: .trailing)
    }

    #if os(iOS) || os(tvOS)
    /// The trailing margin of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var trailingMargin: EdgeXAxis {
        return xEdge(with: .trailingMargin)
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

    #if os(iOS) || os(tvOS)
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
    public var centerX: EdgeXAxis {
        return xEdge(with: .centerX)
    }

    #if os(iOS) || os(tvOS)
    /// The horizontal center within the margins of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerXWithinMargins: EdgeXAxis {
        return xEdge(with: .centerXWithinMargins)
    }
    #endif
}

public protocol SupportsCenterYLayoutProxy: LayoutProxy {}
extension SupportsCenterYLayoutProxy {
    /// The vertical center of the item.
    public var centerY: EdgeYAxis {
        return yEdge(with: .centerY)
    }

    #if os(iOS) || os(tvOS)
    /// The vertical center within the margins of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    public var centerYWithinMargins: EdgeYAxis {
        return yEdge(with: .centerYWithinMargins)
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

    #if os(iOS) || os(tvOS)
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
    public var lastBaseline: EdgeYAxis {
        return yEdge(with: .lastBaseline)
    }

    /// The baseline of the item.
    public var baseline: EdgeYAxis {
        return yEdge(with: .lastBaseline)
    }

    /// The first baseline of the item. iOS exclusive.
    @available(iOS, introduced: 8.0)
    @available(OSX, introduced: 10.11)
    public var firstBaseline: EdgeYAxis {
        return yEdge(with: .firstBaseline)
    }
}

public protocol SupportsPositioningLayoutProxy: SupportsEdgesLayoutProxy, SupportsSizeLayoutProxy, SupportsCenteringLayoutProxy {}
