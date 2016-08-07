//
//  Context.swift
//  Cartography
//
//  Created by Robert Böhnke on 06/10/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

public class Context {
    internal var constraints: [Constraint] = []

    #if os(iOS) || os(tvOS)

        internal func addConstraint(_ from: Property, to: LayoutSupport, coefficients: Coefficients = Coefficients(), relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
            from.view.car_translatesAutoresizingMaskIntoConstraints = false
            
            let layoutConstraint = NSLayoutConstraint(item: from.view,
                                                      attribute: from.attribute,
                                                      relatedBy: relation,
                                                      toItem: to.layoutGuide,
                                                      attribute: to.attribute,
                                                      multiplier: CGFloat(coefficients.multiplier),
                                                      constant: CGFloat(coefficients.constant))
            
            var view = from.view
            while let superview = view.superview {
                view = superview
            }
            constraints.append(Constraint(view: view, layoutConstraint: layoutConstraint))
            
            return layoutConstraint
        }
    
    #endif
    
    internal func addConstraint(_ from: Property, to: Property? = nil, coefficients: Coefficients = Coefficients(), relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        
        from.view.car_translatesAutoresizingMaskIntoConstraints = false

        let layoutConstraint = NSLayoutConstraint(item: from.view,
                                                  attribute: from.attribute,
                                                  relatedBy: relation,
                                                  toItem: to?.view,
                                                  attribute: to?.attribute ?? .notAnAttribute,
                                                  multiplier: CGFloat(coefficients.multiplier),
                                                  constant: CGFloat(coefficients.constant))

        if let to = to {
            if let common = closestCommonAncestor(from.view, b: to.view ) {
                constraints.append(Constraint(view: common, layoutConstraint: layoutConstraint))
            } else {
                fatalError("No common superview found between \(from.view) and \(to.view)")
            }
        } else {
            constraints.append(Constraint(view: from.view, layoutConstraint: layoutConstraint))
        }

        return layoutConstraint
    }

    internal func addConstraint(_ from: Compound, coefficients: [Coefficients]? = nil, to: Compound? = nil, relation: NSLayoutRelation = NSLayoutRelation.equal) -> [NSLayoutConstraint] {
        var results: [NSLayoutConstraint] = []

        for i in 0..<from.properties.count {
            let n: Coefficients = coefficients?[i] ?? Coefficients()

            results.append(addConstraint(from.properties[i], to: to?.properties[i], coefficients: n, relation: relation))
        }

        return results
    }
}
