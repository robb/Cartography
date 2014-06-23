//
//  Priority.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

operator infix ~ { }

@infix func ~(lhs: NSLayoutConstraint, rhs: Float) -> NSLayoutConstraint {
    let constraint = NSLayoutConstraint(item: lhs.firstItem,
                                        attribute: lhs.firstAttribute,
                                        relatedBy: lhs.relation,
                                        toItem: lhs.secondItem,
                                        attribute: lhs.secondAttribute,
                                        multiplier: lhs.multiplier,
                                        constant: lhs.constant)

    constraint.priority = rhs

    return constraint;
}

@infix func ~(lhs: NSLayoutConstraint[], rhs: Float) -> NSLayoutConstraint[] {
    return lhs.map {
        $0 ~ rhs
    }
}
