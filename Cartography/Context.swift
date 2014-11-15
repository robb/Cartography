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
    internal let removeExisting: Bool
    internal let performLayout: Bool

    init(removeExisting: Bool, performLayout: Bool){
        self.removeExisting = removeExisting
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

        let superview = closestCommonAncestor(from.view, to?.view)

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

        if removeExisting {
            for view in views {
                for constraint in view.car_installedLayoutConstraints ?? [] {
                    constraint.uninstall()
                }
            }
        }

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

private func closestCommonAncestor(a: View, b: View?) -> View? {
    
    if let b = b {
        
        // Quick-check the most likely possibilities
        let (aSuper, bSuper) = (a.superview, b.superview)
        if a == bSuper { return a }
        if b == aSuper { return b }
        if aSuper == bSuper { return aSuper }
        
        // None of those; run the general algorithm
        var ancestorsOfA = NSSet(array: Array(ancestors(a)))
        for ancestor in ancestors(b) {
            if ancestorsOfA.containsObject(ancestor) {
                return ancestor
            }
        }
        return nil // No ancestors in common
    }
    return a // b is nil
}

private func ancestors(v: View) -> SequenceOf<View> {
    return SequenceOf<View> { () -> GeneratorOf<View> in
        var view: View? = v
        return GeneratorOf {
            let current = view
            view = view?.superview
            return current
        }
    }
}
