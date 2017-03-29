//
//  Coefficients.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation
#if os(iOS)
    import UIKit
#endif

public struct Coefficients {
    var multiplier: CGFloat = 1
    var constant: CGFloat = 0

    init() { }

    init(_ multiplier: CGFloat, _ constant: CGFloat) {
        self.constant = constant
        self.multiplier = multiplier
    }
}

extension Coefficients {
    // MARK: Addition
    static public func +(c: CGFloat, rhs: Coefficients) -> Coefficients {
        return Coefficients(rhs.multiplier, rhs.constant + c)
    }

    static public func +(lhs: Coefficients, rhs: CGFloat) -> Coefficients {
        return rhs + lhs
    }

    // MARK: Subtraction
    static public func -(c: CGFloat, rhs: Coefficients) -> Coefficients {
        return Coefficients(rhs.multiplier, rhs.constant - c)
    }

    static public func -(lhs: Coefficients, rhs: CGFloat) -> Coefficients {
        return rhs - lhs
    }

    // MARK: Multiplication
    static public func *(m: CGFloat, rhs: Coefficients) -> Coefficients {
        return Coefficients(rhs.multiplier * m, rhs.constant * m)
    }

    static public func *(lhs: Coefficients, rhs: CGFloat) -> Coefficients {
        return rhs * lhs
    }

    // MARK: Division
    static public func /(m: CGFloat, rhs: Coefficients) -> Coefficients {
        return Coefficients(rhs.multiplier / m, rhs.constant / m)
    }

    static public func /(lhs: Coefficients, rhs: CGFloat) -> Coefficients {
        return rhs / lhs
    }
}
