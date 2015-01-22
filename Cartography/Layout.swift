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

    context.installConstraints(performLayout: true)
}

public func layout(v1: View, v2: View, block: (LayoutProxy, LayoutProxy) -> ()) {
    let context = Context()

    block(LayoutProxy(context, v1), LayoutProxy(context, v2))

    context.installConstraints(performLayout: true)
}

public func layout(v1: View, v2: View, v3: View, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) {
    let context = Context()

    block(LayoutProxy(context, v1), LayoutProxy(context, v2), LayoutProxy(context, v3))

    context.installConstraints(performLayout: true)
}

public func layout(views: [View], block:([LayoutProxy]) -> ()) {
    let context = Context()

    block(views.map({ LayoutProxy(context, $0) }))

    context.installConstraints(performLayout: true)
}

public func layout<T: Hashable>(views: [T: View], block:([T : LayoutProxy] -> ())) {
    let context = Context()
    let result = map(views) { ($0, LayoutProxy(context, $1)) }

    block(Dictionary(result))

    context.installConstraints(performLayout: true)
}

public func constrain(view: View, block: LayoutProxy -> ()) {
    let context = Context()

    block(LayoutProxy(context, view))

    context.installConstraints(performLayout: false)
}

public func constrain(v1: View, v2: View, block: (LayoutProxy, LayoutProxy) -> ()) {
    let context = Context()

    block(LayoutProxy(context, v1), LayoutProxy(context, v2))

    context.installConstraints(performLayout: false)
}

public func constrain(v1: View, v2: View, v3: View, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) {
    let context = Context()

    block(LayoutProxy(context, v1), LayoutProxy(context, v2), LayoutProxy(context, v3))

    context.installConstraints(performLayout: false)
}

public func constrain(views: [View], block:([LayoutProxy]) -> ()) {
    let context = Context()

    block(views.map({ LayoutProxy(context, $0) }))

    context.installConstraints(performLayout: false)
}

public func constrain<T: Hashable>(views: [T: View], block:([T : LayoutProxy] -> ())) {
    let context = Context()
    let result = map(views) { ($0, LayoutProxy(context, $1)) }

    block(Dictionary(result))

    context.installConstraints(performLayout: false)
}

// MARK: Dictionary
private extension Dictionary {
    init (_ pairs: [Element]) {
        self.init()
        for (key,value) in pairs {
            self[key] = value
        }
    }
}
