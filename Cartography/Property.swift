//
//  Property.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

protocol Property {
    var view: View { get }
    var attribute: NSLayoutAttribute { get }
}

func apply(from: Property, coefficients: Coefficients = Coefficients(), to: Property? = nil, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> NSLayoutConstraint {
    from.view.car_setTranslatesAutoresizingMaskIntoConstraints(false)

    let superview = commonSuperview(from.view, to?.view)

    var toAttribute: NSLayoutAttribute! = NSLayoutAttribute.NotAnAttribute

    if to == nil {
        toAttribute = NSLayoutAttribute.NotAnAttribute
    } else {
        toAttribute = to!.attribute
    }

    let constraint = NSLayoutConstraint(item: from.view,
                                        attribute: from.attribute,
                                        relatedBy: relation,
                                        toItem: to?.view,
                                        attribute: toAttribute,
                                        multiplier: CGFloat(coefficients.multiplier),
                                        constant: CGFloat(coefficients.constant))

    superview?.addConstraint(constraint)

    return constraint
}

func commonSuperview(a: View, b: View?) -> View? {
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
