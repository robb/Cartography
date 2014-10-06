//
//  Layout.swift
//  Cartography
//
//  Created by Robert Böhnke on 30/09/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public func layout(view: View, block: LayoutProxy -> ()) {
    let context = Context()

    block(LayoutProxy(context, view))

    view.car_updateAutoLayoutConstraints()
}

public func layout(v1: View, v2: View, block: (LayoutProxy, LayoutProxy) -> ()) {
    let context = Context()

    block(LayoutProxy(context, v1), LayoutProxy(context, v2))

    v1.car_updateAutoLayoutConstraints()
    v2.car_updateAutoLayoutConstraints()
}

public func layout(v1: View, v2: View, v3: View, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) {
    let context = Context()

    block(LayoutProxy(context, v1), LayoutProxy(context, v2), LayoutProxy(context, v3))

    v1.car_updateAutoLayoutConstraints()
    v2.car_updateAutoLayoutConstraints()
    v3.car_updateAutoLayoutConstraints()
}

public func layout(views: [View], block:([LayoutProxy]) -> ()) {
    let context = Context()

    block(views.map({ LayoutProxy(context, $0) }))

    for view in views {
        view.car_updateAutoLayoutConstraints()
    }
}
