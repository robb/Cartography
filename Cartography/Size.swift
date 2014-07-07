//
//  Size.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

enum Size : Compound {
    case Size(View)

    var properties: [Property] {
        switch (self) {
            case let .Size(view):
                return [ Dimension.Width(view), Dimension.Height(view) ]
        }
    }
}

// Multiplication

@infix func *(m: Float, rhs: Expression<Size>) -> Expression<Size> {
    return Expression(rhs.value, rhs.coefficients.map { $0 * m })
}

@infix func *(lhs: Expression<Size>, rhs: Float) -> Expression<Size> {
    return rhs * lhs
}

@infix func *(m: Float, rhs: Size) -> Expression<Size> {
    return Expression(rhs, [ Coefficients(m, 0), Coefficients(m, 0) ])
}

@infix func *(lhs: Size, rhs: Float) -> Expression<Size> {
    return rhs * lhs
}

// Division

@infix func /(m: Float, rhs: Expression<Size>) -> Expression<Size> {
    return Expression(rhs.value, rhs.coefficients.map { $0 / m })
}

@infix func /(lhs: Expression<Size>, rhs: Float) -> Expression<Size> {
    return rhs / lhs
}

@infix func /(m: Float, rhs: Size) -> Expression<Size> {
    return Expression(rhs, [ Coefficients(1 / m, 0), Coefficients(1 / m, 0) ])
}

@infix func /(lhs: Size, rhs: Float) -> Expression<Size> {
    return rhs / lhs
}
