//
//  LayoutProxy.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import UIKit

class LayoutProxy {
    let width: Dimension
    let height: Dimension

    let top: Edge
    let right: Edge
    let bottom: Edge
    let left: Edge

    let leading: Edge
    let trailing: Edge

    let centerX: Edge
    let centerY: Edge

    let baseline: Edge
    let firstBaseline: Edge

    init(_ view: UIView) {
        self.width = Dimension.Width(view)
        self.height = Dimension.Height(view)

        self.top = Edge.Top(view)
        self.right = Edge.Right(view)
        self.bottom = Edge.Bottom(view)
        self.left = Edge.Left(view)

        self.leading = Edge.Leading(view)
        self.trailing = Edge.Trailing(view)

        self.centerX = Edge.CenterX(view)
        self.centerY = Edge.CenterY(view)

        self.baseline = Edge.Baseline(view)
        self.firstBaseline = Edge.FirstBaseline(view)
    }
}

func layout(view: UIView, block: LayoutProxy -> ()) {
    block(LayoutProxy(view))

    view.layoutIfNeeded()
}

func layout(v1: UIView, v2: UIView, block: (LayoutProxy, LayoutProxy) -> ()) {
    block(LayoutProxy(v1), LayoutProxy(v2))

    v1.layoutIfNeeded()
    v2.layoutIfNeeded()
}

func layout(v1: UIView, v2: UIView, v3: UIView, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) {
    block(LayoutProxy(v1), LayoutProxy(v2), LayoutProxy(v3))

    v1.layoutIfNeeded()
    v2.layoutIfNeeded()
    v3.layoutIfNeeded()
}

func layout(views: UIView[], block:(LayoutProxy[]) -> ()) {
    block(views.map({ LayoutProxy($0) }))

    for view in views {
        view.layoutIfNeeded()
    }
}
