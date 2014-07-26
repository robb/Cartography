//
//  Expression.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

public struct Expression<T> {
    let value: T
    var coefficients: [Coefficients]

    init(_ value: T, _ coefficients: [Coefficients]) {
        assert(coefficients.count > 0)

        self.value = value
        self.coefficients = coefficients
    }
}
