//
//  LayoutProxy.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public class LayoutProxy {
    public var width: Dimension { return Dimension.Width(self) }
    public var height: Dimension { return Dimension.Height(self) }

    public var size: Size { return Size.Size(self) }

    public var top: Edge { return Edge.Top(self) }
    public var right: Edge { return Edge.Right(self) }
    public var bottom: Edge { return Edge.Bottom(self) }
    public var left: Edge { return Edge.Left(self) }

    public var edges: Edges { return Edges.Edges(self) }

    public var leading: Edge { return Edge.Leading(self) }
    public var trailing: Edge { return Edge.Trailing(self) }

    public var centerX: Edge { return Edge.CenterX(self) }
    public var centerY: Edge { return Edge.CenterY(self) }
    public var center: Point { return Point.Center(self) }

    public var baseline: Edge { return Edge.Baseline(self) }

    let view: View

    public var superview: LayoutProxy? {
        if let superview = view.superview {
            return LayoutProxy(superview)
        } else {
            return nil
        }
    }

    init(_ view: View) {
        self.view = view
    }
}
