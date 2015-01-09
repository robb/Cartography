//
//  View.swift
//  Cartography
//
//  Created by Robert Böhnke on 26/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

#if os(iOS)
    import UIKit
    public typealias View = UIView

    extension View {
        func car_setNeedsLayout() {
            setNeedsLayout()
        }

        func car_updateLayout() {
            layoutIfNeeded()
        }

        func car_setTranslatesAutoresizingMaskIntoConstraints(flag: Bool) {
            setTranslatesAutoresizingMaskIntoConstraints(flag)
        }
    }
#else
    import AppKit
    public typealias View = NSView

    extension View {
        func car_setNeedsLayout() {
            needsLayout = true
        }

        func car_updateLayout() {
            (superview ?? self).layoutSubtreeIfNeeded()
        }

        func car_setTranslatesAutoresizingMaskIntoConstraints(flag: Bool) {
            translatesAutoresizingMaskIntoConstraints = flag
        }
    }
#endif

private var InstalledLayoutConstraintsKey: StaticString = "InstalledLayoutConstraintsKey"

extension View {
    var car_installedLayoutConstraints: [Constraint]? {
        get {
            return objc_getAssociatedObject(self, &InstalledLayoutConstraintsKey) as? [Constraint]
        }
        set {
            objc_setAssociatedObject(self, &InstalledLayoutConstraintsKey, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_COPY_NONATOMIC))
        }
    }
}