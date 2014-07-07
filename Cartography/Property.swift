//
//  Property.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

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

protocol Property {
    var view: View { get }
    var attribute: NSLayoutAttribute { get }
}

func apply(from: Property, coefficients: Coefficients = Coefficients(), to: Property? = nil, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> NSLayoutConstraint {
    from.view.car_setTranslatesAutoresizingMaskIntoConstraints(false)

    let superview = commonSuperview(from.view, to?.view)

    var toAttribute: NSLayoutAttribute! = NSLayoutAttribute.NotAnAttribute

    if to {
        toAttribute = to!.attribute
    } else {
        toAttribute = NSLayoutAttribute.NotAnAttribute
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

// Equality

@infix func ==<P: Property>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value)
}

@infix func ==<P: Property>(lhs: Expression<P>, rhs: P) -> NSLayoutConstraint {
    return rhs == lhs
}

@infix func ==<P: Property>(lhs: P, rhs: P) -> NSLayoutConstraint {
    return apply(lhs, to: rhs)
}

// Inequality

@infix func <=<P: Property>(lhs: P, rhs: P) -> NSLayoutConstraint {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix func >=<P: Property>(lhs: P, rhs: P) -> NSLayoutConstraint {
    return apply(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix func <=<P: Property>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix func <=<P: Property>(lhs: Expression<P>, rhs: P) -> NSLayoutConstraint {
    return rhs >= lhs
}

@infix func >=<P: Property>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix func >=<P: Property>(lhs: Expression<P>, rhs: P) -> NSLayoutConstraint {
    return rhs <= lhs
}
