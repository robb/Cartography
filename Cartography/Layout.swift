//
//  Layout.swift
//  Cartography
//
//  Created by Robert Böhnke on 30/09/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public func layout(view: View, block: LayoutProxy -> ()) -> ConstraintGroup {
    var group = ConstraintGroup()

    group.layout(view, block)

    return group
}

public func layout(v1: View, v2: View, block: (LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    var group = ConstraintGroup()

    group.layout(v1, v2, block)

    return group
}

public func layout(v1: View, v2: View, v3: View, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    var group = ConstraintGroup()

    group.layout(v1, v2, v3, block)

    return group
}

public func layout(views: [View], block:([LayoutProxy]) -> ()) -> ConstraintGroup {
    var group = ConstraintGroup()

    group.layout(views, block)

    return group
}

public func layout<T: Hashable>(views: [T: View], block:([T : LayoutProxy] -> ())) -> ConstraintGroup {
    var group = ConstraintGroup()

    group.layout(views, block)

    return group
}

public func constrain(view: View, block: LayoutProxy -> ()) -> ConstraintGroup {
    var group = ConstraintGroup()

    group.constrain(view, block)

    return group
}

public func constrain(v1: View, v2: View, block: (LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    var group = ConstraintGroup()

    group.constrain(v1, v2, block)

    return group
}

public func constrain(v1: View, v2: View, v3: View, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    var group = ConstraintGroup()

    group.constrain(v1, v2, v3, block)

    return group
}

public func constrain(views: [View], block:([LayoutProxy]) -> ()) -> ConstraintGroup {
    var group = ConstraintGroup()

    group.constrain(views, block)

    return group
}

public func constrain<T: Hashable>(views: [T: View], block:([T : LayoutProxy] -> ())) -> ConstraintGroup {
    var group = ConstraintGroup()

    group.constrain(views, block)

    return group
}
