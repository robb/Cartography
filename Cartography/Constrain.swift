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
/// - parameter view:    The view to layout.
/// - parameter replace: The `ConstraintGroup` whose constraints should be
///                      replaced.
/// - parameter block:   A block that declares the layout for `view`.
///
@discardableResult public func constrain(_ view: View, replace group: ConstraintGroup? = nil, block: (LayoutProxy) -> ()) -> ConstraintGroup {
    let constraintGroup = group ?? ConstraintGroup()
    let context = Context()
    block(LayoutProxy(context, view))
    constraintGroup.replaceConstraints(context.constraints)

    return constraintGroup
}

/// Updates the constraints of two views.
///
/// - parameter view1:   A view to layout.
/// - parameter view2:   A view to layout.
/// - parameter replace: The `ConstraintGroup` whose constraints should be
///                      replaced.
/// - parameter block:   A block that declares the layout for the views.
///
@discardableResult public func constrain(_ view1: View, _ view2: View, replace group: ConstraintGroup? = nil, block: (LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    let constraintGroup = group ?? ConstraintGroup()
    let context = Context()
    block(LayoutProxy(context, view1), LayoutProxy(context, view2))
    constraintGroup.replaceConstraints(context.constraints)

    return constraintGroup
}

/// Updates the constraints of three views.
///
/// - parameter view1:   A view to layout.
/// - parameter view2:   A view to layout.
/// - parameter view3:   A view to layout.
/// - parameter replace: The `ConstraintGroup` whose constraints should be
///                      replaced.
/// - parameter block:   A block that declares the layout for the views.
///
@discardableResult public func constrain(_ view1: View, _ view2: View, _ view3: View, replace group: ConstraintGroup? = nil, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    let constraintGroup = group ?? ConstraintGroup()
    let context = Context()
    block(LayoutProxy(context, view1), LayoutProxy(context, view2), LayoutProxy(context, view3))
    constraintGroup.replaceConstraints(context.constraints)

    return constraintGroup
}

/// Updates the constraints of four views.
///
/// - parameter view1:   A view to layout.
/// - parameter view2:   A view to layout.
/// - parameter view3:   A view to layout.
/// - parameter view4:   A view to layout.
/// - parameter replace: The `ConstraintGroup` whose constraints should be
///                      replaced.
/// - parameter block:   A block that declares the layout for the views.
///
@discardableResult public func constrain(_ view1: View, _ view2: View, _ view3: View, _ view4: View, replace group: ConstraintGroup? = nil, block: (LayoutProxy, LayoutProxy, LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    let constraintGroup = group ?? ConstraintGroup()
    let context = Context()
    block(LayoutProxy(context, view1), LayoutProxy(context, view2), LayoutProxy(context, view3), LayoutProxy(context, view4))
    constraintGroup.replaceConstraints(context.constraints)

    return constraintGroup
}

/// Updates the constraints of five views.
///
/// - parameter view1:   A view to layout.
/// - parameter view2:   A view to layout.
/// - parameter view3:   A view to layout.
/// - parameter view4:   A view to layout.
/// - parameter view5:   A view to layout.
/// - parameter replace: The `ConstraintGroup` whose constraints should be
///                      replaced.
/// - parameter block:   A block that declares the layout for the views.
///
@discardableResult public func constrain(_ view1: View, _ view2: View, _ view3: View, _ view4: View, _ view5: View, replace group: ConstraintGroup? = nil, block: (LayoutProxy, LayoutProxy, LayoutProxy, LayoutProxy, LayoutProxy) -> ()) -> ConstraintGroup {
    let constraintGroup = group ?? ConstraintGroup()
    let context = Context()
    block(LayoutProxy(context, view1), LayoutProxy(context, view2), LayoutProxy(context, view3), LayoutProxy(context, view4), LayoutProxy(context, view5))
    constraintGroup.replaceConstraints(context.constraints)

    return constraintGroup
}

/// Updates the constraints of an array of views.
///
/// - parameter views:   The views to layout.
/// - parameter replace: The `ConstraintGroup` whose constraints should be
///                      replaced.
/// - parameter block:   A block that declares the layout for `views`.
///
@discardableResult public func constrain(_ views: [View], replace group: ConstraintGroup? = nil, block: ([LayoutProxy]) -> ()) -> ConstraintGroup {
    let constraintGroup = group ?? ConstraintGroup()
    let context = Context()
    block(views.map({ LayoutProxy(context, $0) }))
    constraintGroup.replaceConstraints(context.constraints)

    return constraintGroup
}

/// Updates the constraints of a dictionary of views.
///
/// - parameter views:   The views to layout.
/// - parameter replace: The `ConstraintGroup` whose constraints should be
///                      replaced.
/// - parameter block:   A block that declares the layout for `views`.
///
@discardableResult public func constrain<T: Hashable>(_ views: [T: View], replace group: ConstraintGroup? = nil, block: (([T : LayoutProxy]) -> ())) -> ConstraintGroup {
    let constraintGroup = group ?? ConstraintGroup()
    let context = Context()
    let proxies = views.map { ($0, LayoutProxy(context, $1)) }
    var dict = [T:LayoutProxy]()
    
    proxies.forEach {
        dict[$0.0] = $0.1
    }
    
    block(dict)
    constraintGroup.replaceConstraints(context.constraints)

    return constraintGroup
}

/// Removes all constraints for a group.
///
/// - parameter clear: The `ConstraintGroup` whose constraints should be removed.
///
public func constrain(clear group: ConstraintGroup) {
    group.replaceConstraints([])
}
