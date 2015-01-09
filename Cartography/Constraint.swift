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

@objc
internal class Constraint {
    let view: View
    let layoutConstraint: NSLayoutConstraint

    /// return whether the constraint newely installed
    func install() -> Bool {
        if let existing = self.layoutConstraintsSimilarTo(self.layoutConstraint) {
            // if exactly same with existing, do nothing
            if (existing.layoutConstraint.secondItem === layoutConstraint.secondItem &&
                existing.layoutConstraint.secondAttribute == layoutConstraint.secondAttribute &&
                existing.layoutConstraint.constant == layoutConstraint.constant &&
                existing.layoutConstraint.priority == layoutConstraint.priority &&
                existing.layoutConstraint.multiplier == layoutConstraint.multiplier) {
                return false
            }

            // if readonly properties differ from existing, reinstall
            if (existing.layoutConstraint.secondItem !== layoutConstraint.secondItem ||
                existing.layoutConstraint.secondAttribute != layoutConstraint.secondAttribute ||
                existing.layoutConstraint.multiplier != layoutConstraint.multiplier) {
                existing.uninstall()
                view.addConstraint(layoutConstraint)
                return true
            }

            // just update
            if existing.layoutConstraint.constant != layoutConstraint.constant {
                existing.layoutConstraint.constant = layoutConstraint.constant
            }
            if existing.layoutConstraint.priority != layoutConstraint.priority {
                existing.layoutConstraint.priority = layoutConstraint.priority
            }
            view.car_setNeedsLayout()
            return false
        }

        // store view who has set `firstView`'s constarint
        (layoutConstraint.firstItem as View).car_increaseReferenceCountForView(view)

        view.addConstraint(layoutConstraint)
        return true
    }

    func uninstall() {
        view.removeConstraint(layoutConstraint)
        if var existings = view.car_installedLayoutConstraints {
            for (i, existing) in enumerate(existings) {
                if existing === self {
                    existings.removeAtIndex(i)
                    view.car_installedLayoutConstraints = existings
                    break
                }
            }
        }
        (layoutConstraint.firstItem as View).car_decreaseReferenceCountForView(view)
    }

    init(view: View, layoutConstraint: NSLayoutConstraint) {
        self.view = view
        self.layoutConstraint = layoutConstraint
    }

    func layoutConstraintsSimilarTo(layoutConstraint: NSLayoutConstraint) -> Constraint? {
        var existings = view.car_installedLayoutConstraints ?? []
        for referredView in (layoutConstraint.firstItem as View).car_referredViews {
            existings += referredView.car_installedLayoutConstraints ?? []
        }
        for existing in existings {
            if (existing.layoutConstraint.firstItem === layoutConstraint.firstItem &&
                existing.layoutConstraint.firstAttribute == layoutConstraint.firstAttribute &&
                existing.layoutConstraint.relation == layoutConstraint.relation) {
                return existing
            }
        }

        return nil
    }
}
