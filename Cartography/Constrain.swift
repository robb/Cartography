//
//  Constrain.swift
//  Cartography
//
//  Created by Robert Böhnke on 30/09/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

/// Updates the constraints of a single view.
///
/// :param: view    The view to layout.
/// :param: replace The `ConstraintGroup` whose constraints should be replaced.
/// :param: block   A block that declares the layout for `view`.
///
public func constrain(view: View, replace group: ConstraintGroup = ConstraintGroup(), @noescape block: LayoutProxy -> ()) -> ConstraintGroup {
    let context = Context()
    block(LayoutProxy(context, view))
    group.replaceConstraints(context.constraints)

    return group
}

/// Updates the constraints of two views.
///
/// :param: view1   A view to layout.
/// :param: view2   A view to layout.
/// :param: replace The `ConstraintGroup` whose constraints should be replaced.
/// :param: block   A block that declares the layout for the views.
///
public func constrain(view1: View, _ view2: View, replace group: ConstraintGroup = ConstraintGroup(), @noescape block: (LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    let context = Context()
    block(LayoutProxy(context, view1), LayoutProxy(context, view2))
    group.replaceConstraints(context.constraints)

    return group
}

/// Updates the constraints of three views.
///
/// :param: view1   A view to layout.
/// :param: view2   A view to layout.
/// :param: view3   A view to layout.
/// :param: replace The `ConstraintGroup` whose constraints should be replaced.
/// :param: block   A block that declares the layout for the views.
///
public func constrain(view1: View, _ view2: View, _ view3: View, replace group: ConstraintGroup = ConstraintGroup(), @noescape block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    let context = Context()
    block(LayoutProxy(context, view1), LayoutProxy(context, view2), LayoutProxy(context, view3))
    group.replaceConstraints(context.constraints)

    return group
}

/// Updates the constraints of four views.
///
/// :param: view1   A view to layout.
/// :param: view2   A view to layout.
/// :param: view3   A view to layout.
/// :param: view4   A view to layout.
/// :param: replace The `ConstraintGroup` whose constraints should be replaced.
/// :param: block   A block that declares the layout for the views.
///
public func constrain(view1: View, _ view2: View, _ view3: View, _ view4: View, replace group: ConstraintGroup = ConstraintGroup(), @noescape block: (LayoutProxy, LayoutProxy, LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    let context = Context()
    block(LayoutProxy(context, view1), LayoutProxy(context, view2), LayoutProxy(context, view3), LayoutProxy(context, view4))
    group.replaceConstraints(context.constraints)

    return group
}

/// Updates the constraints of five views.
///
/// :param: view1   A view to layout.
/// :param: view2   A view to layout.
/// :param: view3   A view to layout.
/// :param: view4   A view to layout.
/// :param: view5   A view to layout.
/// :param: replace The `ConstraintGroup` whose constraints should be replaced.
/// :param: block   A block that declares the layout for the views.
///
public func constrain(view1: View, _ view2: View, _ view3: View, _ view4: View, _ view5: View, replace group: ConstraintGroup = ConstraintGroup(), @noescape block: (LayoutProxy, LayoutProxy, LayoutProxy, LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    let context = Context()
    block(LayoutProxy(context, view1), LayoutProxy(context, view2), LayoutProxy(context, view3), LayoutProxy(context, view4), LayoutProxy(context, view5))
    group.replaceConstraints(context.constraints)

    return group
}

/// Updates the constraints of an array of views.
///
/// :param: views   The views to layout.
/// :param: replace The `ConstraintGroup` whose constraints should be replaced.
/// :param: block   A block that declares the layout for `views`.
///
public func constrain(views: [View], replace group: ConstraintGroup = ConstraintGroup(), @noescape block: ([LayoutProxy]) -> ()) -> ConstraintGroup {
    let context = Context()
    block(views.map({ LayoutProxy(context, $0) }))
    group.replaceConstraints(context.constraints)

    return group
}

/// Updates the constraints of a dictionary of views.
///
/// :param: views   The views to layout.
/// :param: replace The `ConstraintGroup` whose constraints should be replaced.
/// :param: block   A block that declares the layout for `views`.
///
public func constrain<T: Hashable>(views: [T: View], replace group: ConstraintGroup = ConstraintGroup(), @noescape block: ([T : LayoutProxy] -> ())) -> ConstraintGroup {
    let context = Context()
    let proxies = views.map { ($0, LayoutProxy(context, $1)) }
    block(Dictionary(proxies))
    group.replaceConstraints(context.constraints)

    return group
}

/// Removes all constraints for a group.
///
/// :param: clear The `ConstraintGroup` whose constraints should be removed.
///
public func constrain(clear group: ConstraintGroup) {
    group.replaceConstraints([])
}
