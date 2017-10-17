//
//  Constrain.swift
//  Cartography
//
//  Created by Robert Böhnke on 30/09/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

/// Removes all constraints for a group.
///
/// - parameter clear: The `ConstraintGroup` whose constraints should be removed.
///
public func constrain(clear group: ConstraintGroup) {
    group.replaceConstraints([])
}

/// Updates the constraints of a single layout item.
///
/// - parameter item:       The item to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `item`.
///
@discardableResult public func constrain<A: LayoutItem>(_ item: A, replace group: ConstraintGroup = .init(), block: (A.ProxyType) -> Void) -> ConstraintGroup {
    let proxy = item.asProxy()

    block(proxy)

    group.replaceConstraints(proxy.context.constraints)

    return group
}

/// Updates the constraints of two layout items.
///
/// - parameter item1:      An item to layout.
/// - parameter item2:      An item to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `item`.
///
@discardableResult public func constrain<A: LayoutItem, B: LayoutItem>(_ item1: A, _ item2: B, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = item1.asProxy(context: ctx)
    let proxy2 = item2.asProxy(context: ctx)

    block(proxy1, proxy2)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of three layout items.
///
/// - parameter item1:      An item to layout.
/// - parameter item2:      An item to layout.
/// - parameter item3:      An item to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `item`.
///
@discardableResult public func constrain<A: LayoutItem, B: LayoutItem, C: LayoutItem>(_ item1: A, _ item2: B, _ item3: C, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = item1.asProxy(context: ctx)
    let proxy2 = item2.asProxy(context: ctx)
    let proxy3 = item3.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of four layout items.
///
/// - parameter item1:      An item to layout.
/// - parameter item2:      An item to layout.
/// - parameter item3:      An item to layout.
/// - parameter item4:      An item to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `item`.
///
@discardableResult public func constrain<A: LayoutItem, B: LayoutItem, C: LayoutItem, D: LayoutItem>(_ item1: A, _ item2: B, _ item3: C, _ item4: D, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = item1.asProxy(context: ctx)
    let proxy2 = item2.asProxy(context: ctx)
    let proxy3 = item3.asProxy(context: ctx)
    let proxy4 = item4.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of five layout items.
///
/// - parameter item1:      An item to layout.
/// - parameter item2:      An item to layout.
/// - parameter item3:      An item to layout.
/// - parameter item4:      An item to layout.
/// - parameter item5:      An item to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `item`.
///
@discardableResult public func constrain<A: LayoutItem, B: LayoutItem, C: LayoutItem, D: LayoutItem, E: LayoutItem>(_ item1: A, _ item2: B, _ item3: C, _ item4: D, _ item5: E, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType, E.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = item1.asProxy(context: ctx)
    let proxy2 = item2.asProxy(context: ctx)
    let proxy3 = item3.asProxy(context: ctx)
    let proxy4 = item4.asProxy(context: ctx)
    let proxy5 = item5.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4, proxy5)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of six layout items.
///
/// - parameter item1:      An item to layout.
/// - parameter item2:      An item to layout.
/// - parameter item3:      An item to layout.
/// - parameter item4:      An item to layout.
/// - parameter item5:      An item to layout.
/// - parameter item6:      An item to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `item`.
///
@discardableResult public func constrain<A: LayoutItem, B: LayoutItem, C: LayoutItem, D: LayoutItem, E: LayoutItem, F: LayoutItem>(_ item1: A, _ item2: B, _ item3: C, _ item4: D, _ item5: E, _ item6: F, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType, E.ProxyType, F.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = item1.asProxy(context: ctx)
    let proxy2 = item2.asProxy(context: ctx)
    let proxy3 = item3.asProxy(context: ctx)
    let proxy4 = item4.asProxy(context: ctx)
    let proxy5 = item5.asProxy(context: ctx)
    let proxy6 = item6.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4, proxy5, proxy6)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of seven layout items.
///
/// - parameter item1:      An item to layout.
/// - parameter item2:      An item to layout.
/// - parameter item3:      An item to layout.
/// - parameter item4:      An item to layout.
/// - parameter item5:      An item to layout.
/// - parameter item6:      An item to layout.
/// - parameter item7:      An item to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `item`.
///
@discardableResult public func constrain<A: LayoutItem, B: LayoutItem, C: LayoutItem, D: LayoutItem, E: LayoutItem, F: LayoutItem, G: LayoutItem>(_ item1: A, _ item2: B, _ item3: C, _ item4: D, _ item5: E, _ item6: F, _ item7: G, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType, E.ProxyType, F.ProxyType, G.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = item1.asProxy(context: ctx)
    let proxy2 = item2.asProxy(context: ctx)
    let proxy3 = item3.asProxy(context: ctx)
    let proxy4 = item4.asProxy(context: ctx)
    let proxy5 = item5.asProxy(context: ctx)
    let proxy6 = item6.asProxy(context: ctx)
    let proxy7 = item7.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4, proxy5, proxy6, proxy7)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of eight layout items.
///
/// - parameter item1:      An item to layout.
/// - parameter item2:      An item to layout.
/// - parameter item3:      An item to layout.
/// - parameter item4:      An item to layout.
/// - parameter item5:      An item to layout.
/// - parameter item6:      An item to layout.
/// - parameter item7:      An item to layout.
/// - parameter item8:      An item to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `item`.
///
@discardableResult public func constrain<A: LayoutItem, B: LayoutItem, C: LayoutItem, D: LayoutItem, E: LayoutItem, F: LayoutItem, G: LayoutItem, H: LayoutItem>(_ item1: A, _ item2: B, _ item3: C, _ item4: D, _ item5: E, _ item6: F, _ item7: G, _ item8: H, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType, E.ProxyType, F.ProxyType, G.ProxyType, H.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = item1.asProxy(context: ctx)
    let proxy2 = item2.asProxy(context: ctx)
    let proxy3 = item3.asProxy(context: ctx)
    let proxy4 = item4.asProxy(context: ctx)
    let proxy5 = item5.asProxy(context: ctx)
    let proxy6 = item6.asProxy(context: ctx)
    let proxy7 = item7.asProxy(context: ctx)
    let proxy8 = item8.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4, proxy5, proxy6, proxy7, proxy8)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of nine layout items.
///
/// - parameter item1:      An item to layout.
/// - parameter item2:      An item to layout.
/// - parameter item3:      An item to layout.
/// - parameter item4:      An item to layout.
/// - parameter item5:      An item to layout.
/// - parameter item6:      An item to layout.
/// - parameter item7:      An item to layout.
/// - parameter item8:      An item to layout.
/// - parameter item9:      An item to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `item`.
///
@discardableResult public func constrain<A: LayoutItem, B: LayoutItem, C: LayoutItem, D: LayoutItem, E: LayoutItem, F: LayoutItem, G: LayoutItem, H: LayoutItem, I: LayoutItem>(_ item1: A, _ item2: B, _ item3: C, _ item4: D, _ item5: E, _ item6: F, _ item7: G, _ item8: H, _ item9: I, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType, E.ProxyType, F.ProxyType, G.ProxyType, H.ProxyType, I.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = item1.asProxy(context: ctx)
    let proxy2 = item2.asProxy(context: ctx)
    let proxy3 = item3.asProxy(context: ctx)
    let proxy4 = item4.asProxy(context: ctx)
    let proxy5 = item5.asProxy(context: ctx)
    let proxy6 = item6.asProxy(context: ctx)
    let proxy7 = item7.asProxy(context: ctx)
    let proxy8 = item8.asProxy(context: ctx)
    let proxy9 = item9.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4, proxy5, proxy6, proxy7, proxy8, proxy9)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of ten layout items.
///
/// - parameter item1:      An item to layout.
/// - parameter item2:      An item to layout.
/// - parameter item3:      An item to layout.
/// - parameter item4:      An item to layout.
/// - parameter item5:      An item to layout.
/// - parameter item6:      An item to layout.
/// - parameter item7:      An item to layout.
/// - parameter item8:      An item to layout.
/// - parameter item9:      An item to layout.
/// - parameter item10:     An item to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `item`.
///
@discardableResult public func constrain<A: LayoutItem, B: LayoutItem, C: LayoutItem, D: LayoutItem, E: LayoutItem, F: LayoutItem, G: LayoutItem, H: LayoutItem, I: LayoutItem, J: LayoutItem>(_ item1: A, _ item2: B, _ item3: C, _ item4: D, _ item5: E, _ item6: F, _ item7: G, _ item8: H, _ item9: I, _ item10: J, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType, E.ProxyType, F.ProxyType, G.ProxyType, H.ProxyType, I.ProxyType, J.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = item1.asProxy(context: ctx)
    let proxy2 = item2.asProxy(context: ctx)
    let proxy3 = item3.asProxy(context: ctx)
    let proxy4 = item4.asProxy(context: ctx)
    let proxy5 = item5.asProxy(context: ctx)
    let proxy6 = item6.asProxy(context: ctx)
    let proxy7 = item7.asProxy(context: ctx)
    let proxy8 = item8.asProxy(context: ctx)
    let proxy9 = item9.asProxy(context: ctx)
    let proxy10 = item10.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4, proxy5, proxy6, proxy7, proxy8, proxy9, proxy10)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of an array of layout items.
///
/// - parameter items:   The items to layout.
/// - parameter replace: The `ConstraintGroup` whose constraints should be
///                      replaced.
/// - parameter block:   A block that declares the layout for `items`.
///
@discardableResult public func constrain<T: LayoutItem>(_ items: [T], replace group: ConstraintGroup = .init(), block: ([T.ProxyType]) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy = items.map { $0.asProxy(context: ctx) }
    block(proxy)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of a dictionary of layout items.
///
/// - parameter items:   The items to layout.
/// - parameter replace: The `ConstraintGroup` whose constraints should be
///                      replaced.
/// - parameter block:   A block that declares the layout for `items`.
///
@discardableResult public func constrain<T, U: LayoutItem>(_ items: [T: U], replace group: ConstraintGroup = .init(), block: ([T: U.ProxyType]) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy: [T: U.ProxyType] = items.mapValues { $0.asProxy(context: ctx) }
    block(proxy)

    group.replaceConstraints(ctx.constraints)

    return group
}
