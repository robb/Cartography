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

    @available(OSX, introduced=10.10)
    @available(iOS, introduced=8.0)
    public var active: Bool {
        get {
            return constraints
                .map { $0.layoutConstraint.active }
                .reduce(true) { $0 && $1 }
        }
        set {
            for constraint in constraints {
                constraint.layoutConstraint.active = newValue
            }
        }
    }

    public init() {

    }

    internal func replaceConstraints(constraints: [Constraint]) {
        for constraint in self.constraints {
            constraint.uninstall()
        }

        self.constraints = constraints

        for constraint in self.constraints {
            constraint.install()
        }
    }
}
