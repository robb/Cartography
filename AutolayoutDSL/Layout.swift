//
//  Layout.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import UIKit

class Layout {
    let width: Dimension
    let height: Dimension

    init(_ view: UIView) {
        self.width = Dimension.Width(view)
        self.height = Dimension.Height(view)
    }
}

func layout(view: UIView, block: Layout -> ()) {
    block(Layout(view))

    view.layoutIfNeeded()
}

func layout(v1: UIView, v2: UIView, block: (Layout, Layout) -> ()) {
    block(Layout(v1), Layout(v2))

    v1.layoutIfNeeded()
    v2.layoutIfNeeded()
}

func layout(v1: UIView, v2: UIView, v3: UIView, block: (Layout, Layout, Layout) -> ()) {
    block(Layout(v1), Layout(v2), Layout(v3))

    v1.layoutIfNeeded()
    v2.layoutIfNeeded()
}
