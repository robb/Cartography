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
        func car_updateLayout() {
            layoutIfNeeded()
        }

        func car_disableTranslatesAutoresizingMaskIntoConstraintsIfPossible() {
            if car_isOwnedByViewController {
                setTranslatesAutoresizingMaskIntoConstraints(false)
            }
        }

        private var car_isOwnedByViewController: Bool {
            return self === car_closestViewController?.view
        }

        private var car_closestViewController: UIViewController? {
            var responder: UIResponder = self

            while let nextResponder = nextResponder() {
                responder = nextResponder

                if nextResponder.isKindOfClass(UIViewController.Type) { break }
            }

            return responder as? UIViewController
        }
    }
#else
    import AppKit
    public typealias View = NSView

    extension View {
        func car_updateLayout() {
            (superview ?? self).layoutSubtreeIfNeeded()
        }

        func car_disableTranslatesAutoresizingMaskIntoConstraintsIfPossible() {
            translatesAutoresizingMaskIntoConstraints = false
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