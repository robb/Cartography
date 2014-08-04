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

        self.width = Dimension.Width(view)
        self.height = Dimension.Height(view)

        self.size = Size.Size(view)

        self.top = Edge.Top(view)
        self.right = Edge.Right(view)
        self.bottom = Edge.Bottom(view)
        self.left = Edge.Left(view)

        self.edges = Edges.Edges(view)

        self.leading = Edge.Leading(view)
        self.trailing = Edge.Trailing(view)

        self.centerX = Edge.CenterX(view)
        self.centerY = Edge.CenterY(view)
        self.center = Point.Center(view)

        self.baseline = Edge.Baseline(view)
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
