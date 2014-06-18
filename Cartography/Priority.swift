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
    lhs.priority = rhs

    return lhs
}
