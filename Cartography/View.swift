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
private var ReferenceCountForViewsKey: StaticString = "ReferenceCountForViewsKey"

extension View {
    var car_installedLayoutConstraints: [Constraint]? {
        get {
            return objc_getAssociatedObject(self, &InstalledLayoutConstraintsKey) as? [Constraint]
        }
        set {
            objc_setAssociatedObject(self, &InstalledLayoutConstraintsKey, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_COPY_NONATOMIC))
        }
    }

    private var car_referenceCountsForViews: [View: Int] {
        get {
            return objc_getAssociatedObject(self, &ReferenceCountForViewsKey) as? [View: Int] ?? Dictionary()
        }
        set {
            objc_setAssociatedObject(self, &ReferenceCountForViewsKey, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_COPY_NONATOMIC))
        }
    }

    var car_referredViews: [View] {
        return car_referenceCountsForViews.keys.array
    }

    func car_increaseReferenceCountForView(view: View) {
        var countsForViews = car_referenceCountsForViews
        var count = countsForViews[view] ?? 0
        count += 1
        countsForViews[view] = count
        car_referenceCountsForViews = countsForViews
    }

    func car_decreaseReferenceCountForView(view: View) {
        var countsForViews = car_referenceCountsForViews
        var count = countsForViews[view] ?? 0
        count -= 1
        if count > 0 {
            countsForViews[view] = count
        } else {
            countsForViews.removeValueForKey(view)
        }
        car_referenceCountsForViews = countsForViews
    }
}