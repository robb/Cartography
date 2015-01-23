//
//  ConstraintGroup.swift
//  Cartography
//
//  Created by Robert Böhnke on 22/01/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

import Foundation

public class ConstraintGroup {
    private var constraints: [Constraint] = []

    public init() {

    }

    internal func replaceConstraints(constraints: [Constraint], performLayout: Bool) {
        for constraint in self.constraints {
            constraint.uninstall()

            if performLayout {
                constraint.view.car_updateLayout()
            }
        }

        if performLayout {
            for view in self.constraints.map({ $0.view }) {
                view.car_updateLayout()
            }
        }

        self.constraints = constraints

        for constraint in self.constraints {
            constraint.install()

            let existing = constraint.view.car_installedLayoutConstraints ?? []

            constraint.view.car_installedLayoutConstraints = existing + [ constraint ]
        }

        if performLayout {
            for view in self.constraints.map({ $0.view }) {
                view.car_updateLayout()
            }
        }
    }
}

public extension ConstraintGroup {
    func layout(view: View, block: LayoutProxy -> ()) {
        let context = Context()

        block(LayoutProxy(context, view))

        replaceConstraints(context.constraints, performLayout: true)
    }

    func layout(v1: View, _ v2: View, block: (LayoutProxy, LayoutProxy) -> ()) {
        let context = Context()

        block(LayoutProxy(context, v1), LayoutProxy(context, v2))

        replaceConstraints(context.constraints, performLayout: true)
    }

    func layout(v1: View, _ v2: View, _ v3: View, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) {
        let context = Context()

        block(LayoutProxy(context, v1), LayoutProxy(context, v2), LayoutProxy(context, v3))

        replaceConstraints(context.constraints, performLayout: true)
    }

    func layout(views: [View], block:([LayoutProxy]) -> ()) {
        let context = Context()

        block(views.map({ LayoutProxy(context, $0) }))

        replaceConstraints(context.constraints, performLayout: true)
    }

    func layout<T: Hashable>(views: [T: View], block:([T : LayoutProxy] -> ())) {
        let context = Context()
        let result = map(views) { ($0, LayoutProxy(context, $1)) }

        block(Dictionary(result))

        replaceConstraints(context.constraints, performLayout: true)
    }
}

public extension ConstraintGroup {
    func constrain(view: View, block: LayoutProxy -> ()) {
        let context = Context()

        block(LayoutProxy(context, view))

        replaceConstraints(context.constraints, performLayout: false)
    }

    func constrain(v1: View, _ v2: View, block: (LayoutProxy, LayoutProxy) -> ()) {
        let context = Context()

        block(LayoutProxy(context, v1), LayoutProxy(context, v2))

        replaceConstraints(context.constraints, performLayout: false)
    }

    func constrain(v1: View, _ v2: View, _ v3: View, block: (LayoutProxy, LayoutProxy, LayoutProxy) -> ()) {
        let context = Context()

        block(LayoutProxy(context, v1), LayoutProxy(context, v2), LayoutProxy(context, v3))

        replaceConstraints(context.constraints, performLayout: false)
    }

    func constrain(views: [View], block:([LayoutProxy]) -> ()) {
        let context = Context()

        block(views.map({ LayoutProxy(context, $0) }))

        replaceConstraints(context.constraints, performLayout: false)
    }

    func constrain<T: Hashable>(views: [T: View], block:([T : LayoutProxy] -> ())) {
        let context = Context()
        let result = map(views) { ($0, LayoutProxy(context, $1)) }

        block(Dictionary(result))

        replaceConstraints(context.constraints, performLayout: false)
    }
}
