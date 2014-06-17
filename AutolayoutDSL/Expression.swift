//
//  Expression.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

struct Expression<P: Property> {
    let property: P
    var coefficients: Coefficients

    init(_ property: P, _ coefficients: Coefficients) {
        self.property = property
        self.coefficients = coefficients
    }
}

// Addition

@infix func +<P: Property>(c: Float, rhs: Expression<P>) -> Expression<P> {
    return Expression(rhs.property, rhs.coefficients + c)
}

@infix func +<P: Property>(lhs: Expression<P>, rhs: Float) -> Expression<P> {
    return rhs + lhs
}

// Multiplication

@infix func *<P: Property>(m: Float, rhs: Expression<P>) -> Expression<P> {
    return Expression(rhs.property, rhs.coefficients * m)
}

@infix func *<P: Property>(lhs: Expression<P>, rhs: Float) -> Expression<P> {
    return rhs * lhs
}
