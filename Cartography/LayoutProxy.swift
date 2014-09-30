//
//  LayoutProxy.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public class LayoutProxy {
    public let width: Dimension
    public let height: Dimension

    public let size: Size

    public let top: Edge
    public let right: Edge
    public let bottom: Edge
    public let left: Edge

    public let edges: Edges

    public let leading: Edge
    public let trailing: Edge

    public let centerX: Edge
    public let centerY: Edge
    public let center: Point

    public let baseline: Edge

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

        width = Dimension.Width(view)
        height = Dimension.Height(view)

        size = Size.Size(view)

        top = Edge.Top(view)
        right = Edge.Right(view)
        bottom = Edge.Bottom(view)
        left = Edge.Left(view)

        edges = Edges.Edges(view)

        leading = Edge.Leading(view)
        trailing = Edge.Trailing(view)

        centerX = Edge.CenterX(view)
        centerY = Edge.CenterY(view)
        center = Point.Center(view)

        baseline = Edge.Baseline(view)
    }
}
