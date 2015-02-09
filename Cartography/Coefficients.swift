//
//  Coefficients.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public struct Coefficients {
    var multiplier: Double = 1
    var constant: Double = 0

    init() { }

    init(_ multiplier: Double, _ constant: Double) {
        self.constant = constant
        self.multiplier = multiplier
    }

    init(_ multiplier: Number, _ constant: Number) {
        self.constant = constant.doubleValue
        self.multiplier = multiplier.doubleValue
    }
}

// MARK: Addition

public func + (c: Number, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier, rhs.constant + c.doubleValue)
}

public func + (lhs: Coefficients, rhs: Number) -> Coefficients {
    return rhs + lhs
}

// MARK: Subtraction

public func - (c: Number, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier, rhs.constant - c.doubleValue)
}

public func - (lhs: Coefficients, rhs: Number) -> Coefficients {
    return rhs - lhs
}

// MARK: Multiplication

public func * (m: Number, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier * m.doubleValue, rhs.constant * m.doubleValue)
}

public func * (lhs: Coefficients, rhs: Number) -> Coefficients {
    return rhs * lhs
}

// MARK: Division

public func / (m: Number, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier / m.doubleValue, rhs.constant / m.doubleValue)
}

public func / (lhs: Coefficients, rhs: Number) -> Coefficients {
    return rhs / lhs
}
