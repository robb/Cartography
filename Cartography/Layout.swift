//
//  Layout.swift
//  Cartography
//
//  Created by Robert Böhnke on 30/09/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

/// Adds constraints from `block` to the given view
public func constrain(view: View, block: LayoutProxy -> ()) {
    block(LayoutProxy(view))
}

/// Adds constraints from `block` to the given view & forces a layout pass before returning
public func layout(view: View, block: LayoutProxy -> ()) {
    constrain(view, block)

    view.car_updateLayout()
}

public func constrain(v1: View, v2: View, block: (LayoutProxy, LayoutProxy) -> ()) {
    block(LayoutProxy(v1), LayoutProxy(v2))
}

public func layout(v1: View, v2: View, block: (LayoutProxy, LayoutProxy) -> ()) {
    constrain(v1, v2, block)

    v1.car_updateLayout()
    v2.car_updateLayout()
}

public func constrain(v1: View, v2: View, v3: View, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) {
    block(LayoutProxy(v1), LayoutProxy(v2), LayoutProxy(v3))

}

public func layout(v1: View, v2: View, v3: View, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) {
    constrain(v1, v2, v3, block)

    v1.car_updateLayout()
    v2.car_updateLayout()
    v3.car_updateLayout()
}

public func constrain(views: [View], block:([LayoutProxy]) -> ()) {
    block(views.map({ LayoutProxy($0) }))
}

public func layout(views: [View], block:([LayoutProxy]) -> ()) {
    constrain(views, block)

    for view in views {
        view.car_updateLayout()
    }
}
