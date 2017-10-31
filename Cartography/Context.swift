//
//  Context.swift
//  Cartography
//
//  Created by Robert Böhnke on 06/10/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit

public typealias LayoutRelation = NSLayoutRelation
#else
import AppKit

public typealias LayoutRelation = NSLayoutConstraint.Relation
#endif

public class Context {
    internal var constraints: [Constraint] = []
    
    internal func addConstraint(_ from: Property, to: Property? = nil, coefficients: Coefficients = Coefficients(), relation: LayoutRelation = .equal) -> NSLayoutConstraint {
        if let fromItem = from.item as? View {
            fromItem.translatesAutoresizingMaskIntoConstraints = false
        }

        let layoutConstraint = NSLayoutConstraint(item: from.item,
                                                  attribute: from.attribute,
                                                  relatedBy: relation,
                                                  toItem: to?.item,
                                                  attribute: to?.attribute ?? .notAnAttribute,
                                                  multiplier: CGFloat(coefficients.multiplier),
                                                  constant: CGFloat(coefficients.constant))

        constraints.append(Constraint(layoutConstraint))

        return layoutConstraint
    }

    internal func addConstraint(_ from: Compound, coefficients: [Coefficients]? = nil, to: Compound? = nil, relation: LayoutRelation = .equal) -> [NSLayoutConstraint] {
        var results: [NSLayoutConstraint] = []

        for i in 0..<from.properties.count {
            let n: Coefficients = coefficients?[i] ?? Coefficients()

            results.append(addConstraint(from.properties[i], to: to?.properties[i], coefficients: n, relation: relation))
        }

        return results
    }
}
