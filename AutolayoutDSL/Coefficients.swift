//
//  Coefficients.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

struct Coefficients {
    var multiplier: Float = 1
    var constant: Float = 0

    init() { }

    init(_ multiplier: Float, _ constant: Float) {
        self.multiplier = multiplier
        self.constant = constant
    }
}

// Addition

@infix func +(c: Float, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier, rhs.constant + c)
}

@infix func +(lhs: Coefficients, rhs: Float) -> Coefficients {
    return rhs + lhs
}

// Subtraction

@infix func -(c: Float, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier, rhs.constant - c)
}

@infix func -(lhs: Coefficients, rhs: Float) -> Coefficients {
    return rhs - lhs
}

// Multiplication

@infix func *(m: Float, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier * m, rhs.constant * m)
}

@infix func *(lhs: Coefficients, rhs: Float) -> Coefficients {
    return rhs * lhs
}
