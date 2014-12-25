//
//  Context.swift
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

public class Context {
    internal var constraints: [Constraint] = []
    internal let performLayout: Bool

    init(performLayout: Bool){
        self.performLayout = performLayout
    }

    internal func addConstraint(from: Property, to: Property? = nil, coefficients: Coefficients = Coefficients(), relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
        from.view.car_setTranslatesAutoresizingMaskIntoConstraints(false)

        var toAttribute: NSLayoutAttribute! = NSLayoutAttribute.NotAnAttribute

        if to == nil {
            toAttribute = NSLayoutAttribute.NotAnAttribute
        } else {
            toAttribute = to!.attribute
        }

        let superview = commonSuperview(from.view, to?.view)

        let layoutConstraint = NSLayoutConstraint(item: from.view,
            attribute: from.attribute,
            relatedBy: relation,
            toItem: to?.view,
            attribute: toAttribute,
            multiplier: CGFloat(coefficients.multiplier),
            constant: CGFloat(coefficients.constant))

        constraints += [ Constraint(view: superview!, layoutConstraint: layoutConstraint) ]

        return layoutConstraint
    }

    internal func addConstraint(from: Compound, coefficients: [Coefficients]? = nil, to: Compound? = nil, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> [NSLayoutConstraint] {
        var results: [NSLayoutConstraint] = []

        for i in 0..<from.properties.count {
            let n: Coefficients = coefficients?[i] ?? Coefficients()

            results.append(addConstraint(from.properties[i], coefficients: n, to: to?.properties[i], relation: relation))
        }

        return results
    }

    internal func installConstraints() {
        let views = constraints.map({ $0.view })

        for constraint in constraints {
            constraint.install()

            let existing = constraint.view.car_installedLayoutConstraints ?? []

            constraint.view.car_installedLayoutConstraints = existing + [ constraint ]
        }

        if performLayout {
            for view in views {
                view.car_updateLayout()
            }
        }
    }
}

private func commonSuperview(a: View, b: View?) -> View? {
    if (b == nil) {
        return a;
    } else if (a.superview == b) {
        return b;
    } else if (a == b!.superview) {
        return a;
    } else if (a.superview == b!.superview) {
        return a.superview;
    } else {
        let superviews = NSMutableSet()

        var view: View? = a
        while let superview = view?.superview {
            superviews.addObject(superview)

            view = superview
        }

        view = b
        while let superview = view?.superview {
            if superviews.containsObject(superview) {
                return superview
            }

            view = superview
        }

        return nil
    }
}
