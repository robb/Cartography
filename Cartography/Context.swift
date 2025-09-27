//
//  Context.swift
//  Cartography
//
//  Created by Robert Böhnke on 06/10/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit

public typealias LayoutRelation = NSLayoutConstraint.Relation
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

        func constrainDimensionAnchors() -> NSLayoutConstraint? {
            guard #available(iOS 10.0, macOS 10.12, tvOS 10.0, *) else {
                return nil
            }
            
            guard from.attribute == .notAnAttribute || to?.attribute == .notAnAttribute else {
                return nil
            }
            
            guard let fromAnchor = (from as? Dimension)?.anchor else {
                return nil
            }
            
            if let to = to {
                guard let toAnchor = (to as? Dimension)?.anchor else {
                    return nil
                }
                
                return addConstraint(from: fromAnchor, to: toAnchor, coefficients: coefficients, relation: relation)
            } else {
                return addConstraint(from: fromAnchor, to: coefficients.constant, relation: relation)
            }
        }
        
        let layoutConstraint = constrainDimensionAnchors()
                            ?? NSLayoutConstraint(item: from.item,
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
    
    @available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
    private func addConstraint(from dimension: NSLayoutDimension, to constant: CGFloat, relation: LayoutRelation) -> NSLayoutConstraint {
        switch relation {
        case .lessThanOrEqual:   return dimension.constraint(lessThanOrEqualToConstant: constant)
        case.greaterThanOrEqual: return dimension.constraint(greaterThanOrEqualToConstant: constant)
        case .equal:             return dimension.constraint(equalToConstant: constant)
        @unknown default:        fatalError("Unknown relation \(relation)")
        }
    }
    
    @available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
    private func addConstraint(from dimension: NSLayoutDimension, to other: NSLayoutDimension, coefficients: Coefficients, relation: LayoutRelation) -> NSLayoutConstraint {
        switch relation {
        case .lessThanOrEqual:   return dimension.constraint(lessThanOrEqualTo: other, multiplier: coefficients.multiplier, constant: coefficients.constant)
        case.greaterThanOrEqual: return dimension.constraint(greaterThanOrEqualTo: other, multiplier: coefficients.multiplier, constant: coefficients.constant)
        case .equal:             return dimension.constraint(equalTo: other, multiplier: coefficients.multiplier, constant: coefficients.constant)
        @unknown default:        fatalError("Unknown relation \(relation)")
        }
    }
}
