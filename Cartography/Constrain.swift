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

/// Updates the constraints of a single layout element.
///
/// - parameter element: The element to layout.
/// - parameter replace: The `ConstraintGroup` whose constraints should be
///                      replaced.
/// - parameter block:   A block that declares the layout for `element`.
///
@discardableResult public func constrain<A: LayoutElement>(_ element: A, replace group: ConstraintGroup = .init(), block: (A.ProxyType) -> Void) -> ConstraintGroup {
    let proxy = element.asProxy()

    block(proxy)

    group.replaceConstraints(proxy.context.constraints)

    return group
}

/// Updates the constraints of two layout elements.
///
/// - parameter element1:   An element to layout.
/// - parameter element2:   An element to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `element`.
///
@discardableResult public func constrain<A: LayoutElement, B: LayoutElement>(_ element1: A, _ element2: B, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = element1.asProxy(context: ctx)
    let proxy2 = element2.asProxy(context: ctx)

    block(proxy1, proxy2)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of three layout elements.
///
/// - parameter element1:   An element to layout.
/// - parameter element2:   An element to layout.
/// - parameter element3:   An element to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `element`.
///
@discardableResult public func constrain<A: LayoutElement, B: LayoutElement, C: LayoutElement>(_ element1: A, _ element2: B, _ element3: C, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = element1.asProxy(context: ctx)
    let proxy2 = element2.asProxy(context: ctx)
    let proxy3 = element3.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of four layout elements.
///
/// - parameter element1:   An element to layout.
/// - parameter element2:   An element to layout.
/// - parameter element3:   An element to layout.
/// - parameter element4:   An element to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `element`.
///
@discardableResult public func constrain<A: LayoutElement, B: LayoutElement, C: LayoutElement, D: LayoutElement>(_ element1: A, _ element2: B, _ element3: C, _ element4: D, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = element1.asProxy(context: ctx)
    let proxy2 = element2.asProxy(context: ctx)
    let proxy3 = element3.asProxy(context: ctx)
    let proxy4 = element4.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of five layout elements.
///
/// - parameter element1:   An element to layout.
/// - parameter element2:   An element to layout.
/// - parameter element3:   An element to layout.
/// - parameter element4:   An element to layout.
/// - parameter element5:   An element to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `element`.
///
@discardableResult public func constrain<A: LayoutElement, B: LayoutElement, C: LayoutElement, D: LayoutElement, E: LayoutElement>(_ element1: A, _ element2: B, _ element3: C, _ element4: D, _ element5: E, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType, E.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = element1.asProxy(context: ctx)
    let proxy2 = element2.asProxy(context: ctx)
    let proxy3 = element3.asProxy(context: ctx)
    let proxy4 = element4.asProxy(context: ctx)
    let proxy5 = element5.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4, proxy5)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of six layout elements.
///
/// - parameter element1:   An element to layout.
/// - parameter element2:   An element to layout.
/// - parameter element3:   An element to layout.
/// - parameter element4:   An element to layout.
/// - parameter element5:   An element to layout.
/// - parameter element6:   An element to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `element`.
///
@discardableResult public func constrain<A: LayoutElement, B: LayoutElement, C: LayoutElement, D: LayoutElement, E: LayoutElement, F: LayoutElement>(_ element1: A, _ element2: B, _ element3: C, _ element4: D, _ element5: E, _ element6: F, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType, E.ProxyType, F.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = element1.asProxy(context: ctx)
    let proxy2 = element2.asProxy(context: ctx)
    let proxy3 = element3.asProxy(context: ctx)
    let proxy4 = element4.asProxy(context: ctx)
    let proxy5 = element5.asProxy(context: ctx)
    let proxy6 = element6.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4, proxy5, proxy6)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of seven layout elements.
///
/// - parameter element1:   An element to layout.
/// - parameter element2:   An element to layout.
/// - parameter element3:   An element to layout.
/// - parameter element4:   An element to layout.
/// - parameter element5:   An element to layout.
/// - parameter element6:   An element to layout.
/// - parameter element7:   An element to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `element`.
///
@discardableResult public func constrain<A: LayoutElement, B: LayoutElement, C: LayoutElement, D: LayoutElement, E: LayoutElement, F: LayoutElement, G: LayoutElement>(_ element1: A, _ element2: B, _ element3: C, _ element4: D, _ element5: E, _ element6: F, _ element7: G, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType, E.ProxyType, F.ProxyType, G.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = element1.asProxy(context: ctx)
    let proxy2 = element2.asProxy(context: ctx)
    let proxy3 = element3.asProxy(context: ctx)
    let proxy4 = element4.asProxy(context: ctx)
    let proxy5 = element5.asProxy(context: ctx)
    let proxy6 = element6.asProxy(context: ctx)
    let proxy7 = element7.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4, proxy5, proxy6, proxy7)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of eight layout elements.
///
/// - parameter element1:   An element to layout.
/// - parameter element2:   An element to layout.
/// - parameter element3:   An element to layout.
/// - parameter element4:   An element to layout.
/// - parameter element5:   An element to layout.
/// - parameter element6:   An element to layout.
/// - parameter element7:   An element to layout.
/// - parameter element8:   An element to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `element`.
///
@discardableResult public func constrain<A: LayoutElement, B: LayoutElement, C: LayoutElement, D: LayoutElement, E: LayoutElement, F: LayoutElement, G: LayoutElement, H: LayoutElement>(_ element1: A, _ element2: B, _ element3: C, _ element4: D, _ element5: E, _ element6: F, _ element7: G, _ element8: H, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType, E.ProxyType, F.ProxyType, G.ProxyType, H.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = element1.asProxy(context: ctx)
    let proxy2 = element2.asProxy(context: ctx)
    let proxy3 = element3.asProxy(context: ctx)
    let proxy4 = element4.asProxy(context: ctx)
    let proxy5 = element5.asProxy(context: ctx)
    let proxy6 = element6.asProxy(context: ctx)
    let proxy7 = element7.asProxy(context: ctx)
    let proxy8 = element8.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4, proxy5, proxy6, proxy7, proxy8)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of nine layout elements.
///
/// - parameter element1:   An element to layout.
/// - parameter element2:   An element to layout.
/// - parameter element3:   An element to layout.
/// - parameter element4:   An element to layout.
/// - parameter element5:   An element to layout.
/// - parameter element6:   An element to layout.
/// - parameter element7:   An element to layout.
/// - parameter element8:   An element to layout.
/// - parameter element9:   An element to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `element`.
///
@discardableResult public func constrain<A: LayoutElement, B: LayoutElement, C: LayoutElement, D: LayoutElement, E: LayoutElement, F: LayoutElement, G: LayoutElement, H: LayoutElement, I: LayoutElement>(_ element1: A, _ element2: B, _ element3: C, _ element4: D, _ element5: E, _ element6: F, _ element7: G, _ element8: H, _ element9: I, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType, E.ProxyType, F.ProxyType, G.ProxyType, H.ProxyType, I.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = element1.asProxy(context: ctx)
    let proxy2 = element2.asProxy(context: ctx)
    let proxy3 = element3.asProxy(context: ctx)
    let proxy4 = element4.asProxy(context: ctx)
    let proxy5 = element5.asProxy(context: ctx)
    let proxy6 = element6.asProxy(context: ctx)
    let proxy7 = element7.asProxy(context: ctx)
    let proxy8 = element8.asProxy(context: ctx)
    let proxy9 = element9.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4, proxy5, proxy6, proxy7, proxy8, proxy9)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of ten layout elements.
///
/// - parameter element1:   An element to layout.
/// - parameter element2:   An element to layout.
/// - parameter element3:   An element to layout.
/// - parameter element4:   An element to layout.
/// - parameter element5:   An element to layout.
/// - parameter element6:   An element to layout.
/// - parameter element7:   An element to layout.
/// - parameter element8:   An element to layout.
/// - parameter element9:   An element to layout.
/// - parameter element10:  An element to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `element`.
///
@discardableResult public func constrain<A: LayoutElement, B: LayoutElement, C: LayoutElement, D: LayoutElement, E: LayoutElement, F: LayoutElement, G: LayoutElement, H: LayoutElement, I: LayoutElement, J: LayoutElement>(_ element1: A, _ element2: B, _ element3: C, _ element4: D, _ element5: E, _ element6: F, _ element7: G, _ element8: H, _ element9: I, _ element10: J, replace group: ConstraintGroup = .init(), block: (A.ProxyType, B.ProxyType, C.ProxyType, D.ProxyType, E.ProxyType, F.ProxyType, G.ProxyType, H.ProxyType, I.ProxyType, J.ProxyType) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy1 = element1.asProxy(context: ctx)
    let proxy2 = element2.asProxy(context: ctx)
    let proxy3 = element3.asProxy(context: ctx)
    let proxy4 = element4.asProxy(context: ctx)
    let proxy5 = element5.asProxy(context: ctx)
    let proxy6 = element6.asProxy(context: ctx)
    let proxy7 = element7.asProxy(context: ctx)
    let proxy8 = element8.asProxy(context: ctx)
    let proxy9 = element9.asProxy(context: ctx)
    let proxy10 = element10.asProxy(context: ctx)

    block(proxy1, proxy2, proxy3, proxy4, proxy5, proxy6, proxy7, proxy8, proxy9, proxy10)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of an array of layout elements.
///
/// - parameter elements:   The elements to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `elements`.
///
@discardableResult public func constrain<T: LayoutElement>(_ elements: [T], replace group: ConstraintGroup = .init(), block: ([T.ProxyType]) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy = elements.map { $0.asProxy(context: ctx) }
    block(proxy)

    group.replaceConstraints(ctx.constraints)

    return group
}

/// Updates the constraints of a dictionary of layout elements.
///
/// - parameter elements:   The elements to layout.
/// - parameter replace:    The `ConstraintGroup` whose constraints should be
///                         replaced.
/// - parameter block:      A block that declares the layout for `elements`.
///
@discardableResult public func constrain<T, U: LayoutElement>(_ elements: [T: U], replace group: ConstraintGroup = .init(), block: ([T: U.ProxyType]) -> Void) -> ConstraintGroup {
    let ctx = Context()

    let proxy: [T: U.ProxyType] = elements.mapValues { $0.asProxy(context: ctx) }
    block(proxy)

    group.replaceConstraints(ctx.constraints)

    return group
}
