//
//  Priority.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

infix operator  ~ { }

public func ~(lhs: NSLayoutConstraint, rhs: Float) -> NSLayoutConstraint {
    lhs.priority = rhs

    return lhs
}

public func ~(lhs: [NSLayoutConstraint], rhs: Float) -> [NSLayoutConstraint] {
    return lhs.map {
        $0 ~ rhs
    }
}
