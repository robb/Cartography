//
//  ConstraintGroup.swift
//  Cartography
//
//  Created by Robert Böhnke on 22/01/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

import Foundation

extension Sequence {
    func all(predicate: (Iterator.Element) -> Bool) -> Bool {
        return !contains { !predicate($0) }
    }
}

public class ConstraintGroup {
    private var constraints: [Constraint] = []

    @available(OSX, introduced: 10.10)
    @available(iOS, introduced: 8.0)
    public var active: Bool {
        get {
            return constraints.all { $0.layoutConstraint.isActive }
        }
        set {
            for constraint in constraints {
                constraint.layoutConstraint.isActive = newValue
            }
        }
    }

    public init() {

    }

    internal func replaceConstraints(_ constraints: [Constraint]) {
        for constraint in self.constraints {
            constraint.uninstall()
        }

        self.constraints = constraints

        for constraint in self.constraints {
            constraint.install()
        }
    }
}
