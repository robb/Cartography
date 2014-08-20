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

public func layout(view: View, block: LayoutProxy -> ()) {
    block(LayoutProxy(view))

    view.car_updateAutoLayoutConstraints()
}

public func layout(v1: View, v2: View, block: (LayoutProxy, LayoutProxy) -> ()) {
    block(LayoutProxy(v1), LayoutProxy(v2))

    v1.car_updateAutoLayoutConstraints()
    v2.car_updateAutoLayoutConstraints()
}

public func layout(v1: View, v2: View, v3: View, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) {
    block(LayoutProxy(v1), LayoutProxy(v2), LayoutProxy(v3))

    v1.car_updateAutoLayoutConstraints()
    v2.car_updateAutoLayoutConstraints()
    v3.car_updateAutoLayoutConstraints()
}

public func layout(views: [View], block:([LayoutProxy]) -> ()) {
    block(views.map({ LayoutProxy($0) }))

    for view in views {
        view.car_updateAutoLayoutConstraints()
    }
}
