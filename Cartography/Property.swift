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

public func ==(lhs: Property, rhs: Float) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, coefficients: Coefficients(1, rhs))
}

public func ==(lhs: Float, rhs: Property) -> NSLayoutConstraint {
    return rhs == lhs
}

public func ==<P: Property>(lhs: P, rhs: Expression<P>) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, coefficients: rhs.coefficients[0], to: rhs.value)
}

public func ==<P: Property>(lhs: Expression<P>, rhs: P) -> NSLayoutConstraint {
    return rhs == lhs
}

public func ==<P: Property>(lhs: P, rhs: P) -> NSLayoutConstraint {
    return lhs.proxy.apply(lhs, to: rhs)
}
