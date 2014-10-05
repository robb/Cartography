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

public protocol Property {
    var attribute: NSLayoutAttribute { get }
    var proxy: LayoutProxy { get }
    var view: View { get }
}

// MARK: Equality

public protocol Equality : Property { }

public func ==(lhs: Equality, rhs: Float) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, coefficients: Coefficients(1, rhs))
}

public func ==(lhs: Float, rhs: Equality) -> NSLayoutConstraint {
    return rhs == lhs
}

public func ==<P: Equality>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value)
}

public func ==<P: Equality>(lhs: Expression<P>, rhs: P) -> NSLayoutConstraint {
    return rhs == lhs
}

public func ==<P: Equality>(lhs: P, rhs: P) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, to: rhs)
}

// MARK: Inequality

public protocol Inequality : Property { }

public func <=(lhs: Inequality, rhs: Float) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.LessThanOrEqual)
}

public func <=(lhs: Float, rhs: Inequality) -> NSLayoutConstraint {
    return rhs >= lhs
}

public func >=(lhs: Inequality, rhs: Float) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func >=(lhs: Float, rhs: Inequality) -> NSLayoutConstraint {
    return rhs <= lhs
}

public func <=<P: Inequality>(lhs: P, rhs: P) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

public func >=<P: Inequality>(lhs: P, rhs: P) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func <=<P: Inequality>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

public func <=<P: Inequality>(lhs: Expression<P>, rhs: P) -> NSLayoutConstraint {
    return rhs >= lhs
}

public func >=<P: Inequality>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}

public func >=<P: Inequality>(lhs: Expression<P>, rhs: P) -> NSLayoutConstraint {
    return rhs <= lhs
}
