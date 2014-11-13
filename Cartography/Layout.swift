//
//  Layout.swift
//  Cartography
//
//  Created by Robert Böhnke on 30/09/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public func layout(view: View, block: LayoutProxy -> ()) {
    let context = Context(performLayout: true)

    block(LayoutProxy(context, view))

    context.installConstraints()
}

public func layout(v1: View, v2: View, block: (LayoutProxy, LayoutProxy) -> ()) {
    let context = Context(performLayout: true)

    block(LayoutProxy(context, v1), LayoutProxy(context, v2))

    context.installConstraints()
}

public func layout(v1: View, v2: View, v3: View, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) {
    let context = Context(performLayout: true)

    block(LayoutProxy(context, v1), LayoutProxy(context, v2), LayoutProxy(context, v3))

    context.installConstraints()
}

public func layout(views: [View], block:([LayoutProxy]) -> ()) {
    let context = Context(performLayout: true)

    block(views.map({ LayoutProxy(context, $0) }))

    context.installConstraints()
}

public func addConstraints(view: View, block: LayoutProxy -> ()) {
    let context = Context(performLayout: false)

    block(LayoutProxy(context, view))

    context.installConstraints()
}

public func addConstraints(v1: View, v2: View, block: (LayoutProxy, LayoutProxy) -> ()) {
    let context = Context(performLayout: false)

    block(LayoutProxy(context, v1), LayoutProxy(context, v2))

    context.installConstraints()
}

public func addConstraints(v1: View, v2: View, v3: View, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) {
    let context = Context(performLayout: false)

    block(LayoutProxy(context, v1), LayoutProxy(context, v2), LayoutProxy(context, v3))

    context.installConstraints()
}

public func addConstraints(views: [View], block:([LayoutProxy]) -> ()) {
    let context = Context(performLayout: false)

    block(views.map({ LayoutProxy(context, $0) }))

    context.installConstraints()
}
