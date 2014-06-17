//
//  Expression.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

struct Expression {
    let property: Property
    var coefficients: Coefficients

    init(_ property: Property, _ coefficients: Coefficients) {
        self.property = property
        self.coefficients = coefficients
    }
}

// Addition

@infix func +(c: Float, rhs: Expression) -> Expression {
    return Expression(rhs.property, rhs.coefficients + c)
}

@infix func +(lhs: Expression, rhs: Float) -> Expression {
    return rhs + lhs
}

// Multiplication

@infix func *(m: Float, rhs: Expression) -> Expression {
    return Expression(rhs.property, rhs.coefficients * m)
}

@infix func *(lhs: Expression, rhs: Float) -> Expression {
    return rhs * lhs
}
