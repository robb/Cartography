//
//  Coefficients.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public struct Coefficients {
    var multiplier: Float = 1
    var constant: Float = 0

    init() { }

    init(_ multiplier: Float, _ constant: Float) {
        self.multiplier = multiplier
        self.constant = constant
    }
}

// Addition

@infix public func +(c: Float, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier, rhs.constant + c)
}

@infix public func +(lhs: Coefficients, rhs: Float) -> Coefficients {
    return rhs + lhs
}

// Subtraction

@infix public func -(c: Float, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier, rhs.constant - c)
}

@infix public func -(lhs: Coefficients, rhs: Float) -> Coefficients {
    return rhs - lhs
}

// Multiplication

@infix public func *(m: Float, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier * m, rhs.constant * m)
}

@infix public func *(lhs: Coefficients, rhs: Float) -> Coefficients {
    return rhs * lhs
}

// Division

@infix public func /(m: Float, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier / m, rhs.constant / m)
}

@infix public func /(lhs: Coefficients, rhs: Float) -> Coefficients {
    return rhs / lhs
}
