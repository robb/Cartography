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

func apply(from: Property, coefficients: Coefficients = Coefficients(), to: Property? = nil, relation: NSLayoutRelation = NSLayoutRelation.Equal, priority: Float? = nil) -> NSLayoutConstraint {
    from.view.setTranslatesAutoresizingMaskIntoConstraints(false)

    let superview = commonSuperview(from.view, to?.view)

    var toAttribute: NSLayoutAttribute! = NSLayoutAttribute.NotAnAttribute

    if to != nil { toAttribute = to!.attribute }

    let constraint = NSLayoutConstraint(item: from.view,
                                        attribute: from.attribute,
                                        relatedBy: relation,
                                        toItem: to?.view,
                                        attribute: toAttribute,
                                        multiplier: coefficients.multiplier,
                                        constant: coefficients.constant)

    if let priority = priority {
        constraint.priority = priority
    }

    superview?.addConstraint(constraint)

    return constraint
}

protocol Property {
    var view: UIView { get }
    var attribute: NSLayoutAttribute { get }
}
