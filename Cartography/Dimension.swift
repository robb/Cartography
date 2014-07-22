//
//  Dimension.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public enum Dimension : Property {
    case Width(View)
    case Height(View)

    public var view: View {
        switch (self) {
            case let .Width(view): return view
            case let .Height(view): return view
        }
    }

    public var attribute: NSLayoutAttribute {
        switch (self) {
            case .Width(_): return NSLayoutAttribute.Width
            case .Height(_): return NSLayoutAttribute.Height
        }
    }
}

// Equality

@infix public func ==(lhs: Dimension, rhs: Float) -> NSLayoutConstraint {
    return apply(lhs, coefficients: Coefficients(1, rhs))
}

@infix public func ==(lhs: Float, rhs: Dimension) -> NSLayoutConstraint {
    return rhs == lhs
}

// Inequality

@infix public func <=(lhs: Dimension, rhs: Float) -> NSLayoutConstraint {
    return apply(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.LessThanOrEqual)
}

@infix public func <=(lhs: Float, rhs: Dimension) -> NSLayoutConstraint {
    return rhs >= lhs
}

@infix public func >=(lhs: Dimension, rhs: Float) -> NSLayoutConstraint {
    return apply(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix public func >=(lhs: Float, rhs: Dimension) -> NSLayoutConstraint {
    return rhs <= lhs
}
