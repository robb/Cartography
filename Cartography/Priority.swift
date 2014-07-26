//
//  Priority.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public operator infix ~ { }

@infix public func ~(lhs: NSLayoutConstraint, rhs: Float) -> NSLayoutConstraint {
    lhs.priority = rhs

    return lhs
}

@infix public func ~(lhs: [NSLayoutConstraint], rhs: Float) -> [NSLayoutConstraint] {
    return lhs.map {
        $0 ~ rhs
    }
}
