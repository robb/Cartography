//
//  Constrain.swift
//  Cartography
//
//  Created by Robert Böhnke on 30/09/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation
import UIKit

/// Updates the constraints of a single view.
///
/// - parameter views:    The views to layout.
/// - parameter replace: The `ConstraintGroup` whose constraints should be
///                      replaced.
/// - parameter block:   A block that declares the layout for `view`.
///
public func constrain(views: View..., replace group: ConstraintGroup = ConstraintGroup(), @noescape block: LayoutProxy -> ()) -> ConstraintGroup {
    let context = Context()
    for view in views {
        block(LayoutProxy(context, view))
    }
    group.replaceConstraints(context.constraints)
    
    return group
}

/// Updates the constraints of an array of views.
///
/// - parameter views:   The views to layout.
/// - parameter replace: The `ConstraintGroup` whose constraints should be
///                      replaced.
/// - parameter block:   A block that declares the layout for `views`.
///
public func constrain(views: [View], replace group: ConstraintGroup = ConstraintGroup(), @noescape block: ([LayoutProxy]) -> ()) -> ConstraintGroup {
    let context = Context()
    block(views.map({ LayoutProxy(context, $0) }))
    group.replaceConstraints(context.constraints)
    
    return group
}

/// Updates the constraints of a dictionary of views.
///
/// - parameter views:   The views to layout.
/// - parameter replace: The `ConstraintGroup` whose constraints should be
///                      replaced.
/// - parameter block:   A block that declares the layout for `views`.
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
/// - parameter clear: The `ConstraintGroup` whose constraints should be removed.
///
public func constrain(clear group: ConstraintGroup) {
    group.replaceConstraints([])
}
