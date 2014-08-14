//
//  Compound.swift
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

protocol Compound {
    var properties: [Property] { get }
}

func apply(from: Compound, coefficients: [Coefficients]? = nil, to: Compound? = nil, relation: NSLayoutRelation = NSLayoutRelation.Equal) -> [NSLayoutConstraint] {
    var results: [NSLayoutConstraint] = []

    for i in 0..<from.properties.count {
        let n: Coefficients = coefficients?[i] ?? Coefficients()

        results.append(apply(from.properties[i], coefficients: n, to: to?.properties[i], relation: relation))
    }

    return results
}
