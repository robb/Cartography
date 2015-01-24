//
//  Layout.swift
//  Cartography
//
//  Created by Robert Böhnke on 30/09/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public func layout(view: View, replace group: ConstraintGroup = ConstraintGroup(), block: LayoutProxy -> ()) -> ConstraintGroup {
    let context = Context()
    block(LayoutProxy(context, view))
    group.replaceConstraints(context.constraints, performLayout: true)

    return group
}

public func layout(v1: View, v2: View, replace group: ConstraintGroup = ConstraintGroup(), block: (LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    let context = Context()
    block(LayoutProxy(context, v1), LayoutProxy(context, v2))
    group.replaceConstraints(context.constraints, performLayout: true)

    return group
}

public func layout(v1: View, v2: View, v3: View, replace group: ConstraintGroup = ConstraintGroup(), block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    let context = Context()
    block(LayoutProxy(context, v1), LayoutProxy(context, v2), LayoutProxy(context, v3))
    group.replaceConstraints(context.constraints, performLayout: true)

    return group
}

public func layout(views: [View], replace group: ConstraintGroup = ConstraintGroup(), block: ([LayoutProxy]) -> ()) -> ConstraintGroup {
    let context = Context()
    block(views.map({ LayoutProxy(context, $0) }))
    group.replaceConstraints(context.constraints, performLayout: true)

    return group
}

public func layout<T: Hashable>(views: [T: View], replace group: ConstraintGroup = ConstraintGroup(), block: ([T : LayoutProxy] -> ())) -> ConstraintGroup {
    let context = Context()
    let proxies = map(views) { ($0, LayoutProxy(context, $1)) }
    block(Dictionary(proxies))
    group.replaceConstraints(context.constraints, performLayout: true)

    return group
}

public func constrain(view: View, replace group: ConstraintGroup = ConstraintGroup(), block: LayoutProxy -> ()) -> ConstraintGroup {
    let context = Context()
    block(LayoutProxy(context, view))
    group.replaceConstraints(context.constraints, performLayout: false)

    return group
}

public func constrain(v1: View, v2: View, replace group: ConstraintGroup = ConstraintGroup(), block: (LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    let context = Context()
    block(LayoutProxy(context, v1), LayoutProxy(context, v2))
    group.replaceConstraints(context.constraints, performLayout: false)

    return group
}

public func constrain(v1: View, v2: View, v3: View, replace group: ConstraintGroup = ConstraintGroup(), block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    let context = Context()
    block(LayoutProxy(context, v1), LayoutProxy(context, v2), LayoutProxy(context, v3))
    group.replaceConstraints(context.constraints, performLayout: false)

    return group
}

public func constrain(views: [View], replace group: ConstraintGroup = ConstraintGroup(), block: ([LayoutProxy]) -> ()) -> ConstraintGroup {
    let context = Context()
    block(views.map({ LayoutProxy(context, $0) }))
    group.replaceConstraints(context.constraints, performLayout: false)

    return group
}

public func constrain<T: Hashable>(views: [T: View], replace group: ConstraintGroup = ConstraintGroup(), block: ([T : LayoutProxy] -> ())) -> ConstraintGroup {
    let context = Context()
    let proxies = map(views) { ($0, LayoutProxy(context, $1)) }
    block(Dictionary(proxies))
    group.replaceConstraints(context.constraints, performLayout: false)

    return group
}
