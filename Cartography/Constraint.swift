//
//  Constraint.swift
//  Cartography
//
//  Created by Robert Böhnke on 06/10/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

internal class Constraint {
    let layoutConstraint: NSLayoutConstraint

    func install() {
        layoutConstraint.isActive = true
    }

    func uninstall() {
        layoutConstraint.isActive = false
    }

    init(_ layoutConstraint: NSLayoutConstraint) {
        self.layoutConstraint = layoutConstraint
    }
}
