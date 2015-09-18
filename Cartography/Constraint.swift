//
//  Constraint.swift
//  Cartography
//
//  Created by Robert Böhnke on 06/10/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

internal class Constraint {
    // Set to weak to avoid a retain cycle on the associated view.
    weak var view: View?
    let layoutConstraint: NSLayoutConstraint

    func install() {
        view?.addConstraint(layoutConstraint)
    }

    func uninstall() {
        view?.removeConstraint(layoutConstraint)
    }

    init(view: View, layoutConstraint: NSLayoutConstraint) {
        self.view = view
        self.layoutConstraint = layoutConstraint
    }
}
