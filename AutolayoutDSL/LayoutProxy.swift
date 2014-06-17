//
//  LayoutProxy.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import UIKit

class LayoutProxy {
    let width: Dimension
    let height: Dimension

    init(_ view: UIView) {
        self.width = Dimension.Width(view)
        self.height = Dimension.Height(view)
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
}
