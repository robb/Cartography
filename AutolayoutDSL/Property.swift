//
//  Property.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

func commonSuperview(a: UIView, b: UIView?) -> UIView? {
    if (b == nil) {
        return a;
    } else if (a.superview == b) {
        return b;
    } else if (a == b!.superview) {
        return a;
    } else if (a.superview == b!.superview) {
        return a.superview;
    }

    return nil;
}

func apply(predicate: Predicate, from: Property, to: Property?, toAttribute: NSLayoutAttribute) -> NSLayoutConstraint {
    from.view.setTranslatesAutoresizingMaskIntoConstraints(false)

    let superview = commonSuperview(from.view, to?.view)

    let constraint = NSLayoutConstraint(item: from.view,
                                        attribute: from.attribute,
                                        relatedBy: predicate.relation,
                                        toItem: to?.view,
                                        attribute: toAttribute,
                                        multiplier: predicate.multiplier,
                                        constant: predicate.constant)

    if let priority = predicate.priority {
        constraint.priority = priority
    }

    superview?.addConstraint(constraint)

    return constraint
}

protocol Property {
    var view: UIView { get }
    var attribute: NSLayoutAttribute { get }
}
