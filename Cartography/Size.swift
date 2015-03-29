//
//  Size.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

public struct Size : Compound, RelativeCompoundEquality, RelativeCompoundInequality {
    public let context: Context
    public let properties: [Property]

    internal init(_ context: Context, _ properties: [Property]) {
        self.context = context
        self.properties = properties
    }
}

// MARK: Multiplication

public func * (m: Number, rhs: Expression<Size>) -> Expression<Size> {
    return Expression(rhs.value, rhs.coefficients.map { $0 * m.doubleValue })
}

public func * (lhs: Expression<Size>, rhs: Number) -> Expression<Size> {
    return rhs * lhs
}

public func * (m: Number, rhs: Size) -> Expression<Size> {
    return Expression(rhs, [ Coefficients(m.doubleValue, 0), Coefficients(m.doubleValue, 0) ])
}

public func * (lhs: Size, rhs: Number) -> Expression<Size> {
    return rhs * lhs
}

// MARK: Division

public func / (lhs: Expression<Size>, rhs: Number) -> Expression<Size> {
    return lhs * (1 / rhs.doubleValue)
}

public func / (lhs: Size, rhs: Number) -> Expression<Size> {
    return lhs * (1 / rhs.doubleValue)
}
