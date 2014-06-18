//
//  Property.swift
//  Cartography
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
    } else {
        let superviews = NSMutableSet()

        var view: UIView? = a
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
    var view: UIView { get }
    var attribute: NSLayoutAttribute { get }
}

func apply(from: Property, coefficients: Coefficients = Coefficients(), to: Property? = nil, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> NSLayoutConstraint {
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

    superview?.addConstraint(constraint)

    return constraint
}

// Equality

@infix func ==<P: Property>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return apply(lhs, coefficients: rhs.coefficients, to: rhs.property)
}

@infix func ==<P: Property>(lhs: Expression<P>, rhs: P) -> NSLayoutConstraint {
    return rhs == lhs
}

@infix func ==<P: Property>(lhs: P, rhs: P) -> NSLayoutConstraint {
    return apply(lhs, to: rhs)
}

// Inequality

@infix func <=<P: Property>(lhs: P, rhs: Float) {
    apply(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.LessThanOrEqual)
}

@infix func <=<P: Property>(lhs: Float, rhs: P) {
    return rhs >= lhs
}

@infix func >=<P: Property>(lhs: P, rhs: Float) {
    apply(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix func >=<P: Property>(lhs: Float, rhs: P) {
    return rhs <= lhs
}

@infix func <=<P: Property>(lhs: P, rhs: P) {
    apply(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix func >=<P: Property>(lhs: P, rhs: P) {
    apply(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix func <=<P: Property>(lhs: P, rhs: Expression<P>) {
    apply(lhs, coefficients: rhs.coefficients, to: rhs.property, relation: NSLayoutRelation.LessThanOrEqual)
}

@infix func <=<P: Property>(lhs: Expression<P>, rhs: P) {
    return rhs >= lhs
}

@infix func >=<P: Property>(lhs: P, rhs: Expression<P>) {
    apply(lhs, coefficients: rhs.coefficients, to: rhs.property, relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix func >=<P: Property>(lhs: Expression<P>, rhs: P) {
    return rhs <= lhs
}
