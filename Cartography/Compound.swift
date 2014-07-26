//
//  Compound.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

protocol Compound {
    var properties: [Property] { get }
}

func apply(from: Compound, coefficients: [Coefficients]? = nil, to: Compound? = nil, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> [NSLayoutConstraint] {
    var results: [NSLayoutConstraint] = []

    for i in 0..<from.properties.count {
        var n: Coefficients
        if coefficients {
            n = coefficients![i]
        } else {
            n = Coefficients()
        }

        results += apply(from.properties[i], coefficients: n, to: to?.properties[i], relation: relation)
    }

    return results
}
