//
//  Expression.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

struct Expression {
    let dimension: Dimension
    var coefficients: Coefficients

    init(_ dimension: Dimension, _ coefficients: Coefficients) {
        self.dimension = dimension
        self.coefficients = coefficients
    }
}

// Addition

@infix func +(c: Float, rhs: Expression) -> Expression {
    return Expression(rhs.dimension, rhs.coefficients + c)
}

@infix func +(lhs: Expression, rhs: Float) -> Expression {
    return rhs + lhs
}

// Multiplication

@infix func *(m: Float, rhs: Expression) -> Expression {
    return Expression(rhs.dimension, rhs.coefficients * m)
}

@infix func *(lhs: Expression, rhs: Float) -> Expression {
    return rhs * lhs
}
