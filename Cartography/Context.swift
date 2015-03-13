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

    internal func addConstraint(from: Property, to: Property? = nil, coefficients: Coefficients = Coefficients(), relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint {
        from.view.car_disableTranslatesAutoresizingMaskIntoConstraintsIfPossible()
        to?.view.car_disableTranslatesAutoresizingMaskIntoConstraintsIfPossible()

        var toAttribute: NSLayoutAttribute! = NSLayoutAttribute.NotAnAttribute

        if to == nil {
            toAttribute = NSLayoutAttribute.NotAnAttribute
        } else {
            toAttribute = to!.attribute
        }

        var targetView: View

        if let toView = to?.view {
            let target = closestCommonAncestor(from.view, toView)
            assert(target != .None, "No common superview found between \(from.view) and \(toView)")

            targetView = target!
        } else {
            targetView = from.view
        }

        let layoutConstraint = NSLayoutConstraint(item: from.view,
                                                  attribute: from.attribute,
                                                  relatedBy: relation,
                                                  toItem: to?.view,
                                                  attribute: toAttribute,
                                                  multiplier: CGFloat(coefficients.multiplier),
                                                  constant: CGFloat(coefficients.constant))

        constraints += [ Constraint(view: targetView, layoutConstraint: layoutConstraint) ]

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
}
