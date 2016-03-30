//
//  Coefficients.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public struct Coefficients {
    public var multiplier: CGFloat = 1
    public var constant: CGFloat = 0

    public init() { }

    public init(_ multiplier: CGFloat, _ constant: CGFloat) {
        self.constant = constant
        self.multiplier = multiplier
    }
}

// MARK: Addition

public func + (c: CGFloat, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier, rhs.constant + c)
}

public func + (lhs: Coefficients, rhs: CGFloat) -> Coefficients {
    return rhs + lhs
}

// MARK: Subtraction

public func - (c: CGFloat, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier, rhs.constant - c)
}

public func - (lhs: Coefficients, rhs: CGFloat) -> Coefficients {
    return rhs - lhs
}

// MARK: Multiplication

public func * (m: CGFloat, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier * m, rhs.constant * m)
}

public func * (lhs: Coefficients, rhs: CGFloat) -> Coefficients {
    return rhs * lhs
}

// MARK: Division

public func / (m: CGFloat, rhs: Coefficients) -> Coefficients {
    return Coefficients(rhs.multiplier / m, rhs.constant / m)
}

public func / (lhs: Coefficients, rhs: CGFloat) -> Coefficients {
    return rhs / lhs
}
