//
//  Dimension.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

enum Dimension : Property {
    case Width(View)
    case Height(View)

    var view: View {
        switch (self) {
            case let .Width(view): return view
            case let .Height(view): return view
        }
    }

    var attribute: NSLayoutAttribute {
        switch (self) {
            case .Width(_): return NSLayoutAttribute.Width
            case .Height(_): return NSLayoutAttribute.Height
        }
    }
}

// Equality

@infix func ==(lhs: Dimension, rhs: Float) -> NSLayoutConstraint {
    return apply(lhs, coefficients: Coefficients(1, rhs))
}

@infix func ==(lhs: Float, rhs: Dimension) -> NSLayoutConstraint {
    return rhs == lhs
}

// Inequality

@infix func <=(lhs: Dimension, rhs: Float) -> NSLayoutConstraint {
    return apply(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.LessThanOrEqual)
}

@infix func <=(lhs: Float, rhs: Dimension) -> NSLayoutConstraint {
    return rhs >= lhs
}

@infix func >=(lhs: Dimension, rhs: Float) -> NSLayoutConstraint {
    return apply(lhs, coefficients: Coefficients(1, rhs), relation: NSLayoutRelation.GreaterThanOrEqual)
}

@infix func >=(lhs: Float, rhs: Dimension) -> NSLayoutConstraint {
    return rhs <= lhs
}
