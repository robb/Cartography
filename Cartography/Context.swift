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

    #if os(iOS) || os(tvOS)

    internal func addConstraint(_ from: Property, to: LayoutSupport, coefficients: Coefficients = Coefficients(), relation: LayoutRelation = .equal) -> NSLayoutConstraint {
            from.view.car_translatesAutoresizingMaskIntoConstraints = false

            let item: LayoutItem
            if #available(iOS 11.0, tvOS 11.0, *), from.needsSafeArea {
                item = from.view.safeAreaLayoutGuide
            } else {
                item = from.view
            }

            let layoutConstraint = NSLayoutConstraint(item: item,
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

    internal func addConstraint(_ from: Property, to: Property? = nil, coefficients: Coefficients = Coefficients(), relation: LayoutRelation = .equal) -> NSLayoutConstraint {

        from.view.car_translatesAutoresizingMaskIntoConstraints = false

        let item: LayoutItem
        let toItem: LayoutItem?

        if #available(iOS 11.0, tvOS 11.0, *), from.needsSafeArea {
            item = from.view.safeAreaLayoutGuide
        } else {
            item = from.view
        }

        if #available(iOS 11.0, tvOS 11.0, *), let needsSafeArea = to?.needsSafeArea, needsSafeArea {
            toItem = to?.view.safeAreaLayoutGuide
        } else {
            toItem = to?.view
        }

        let layoutConstraint = NSLayoutConstraint(item: item,
                                                  attribute: from.attribute,
                                                  relatedBy: relation,
                                                  toItem: toItem,
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

    #else

    internal func addConstraint(_ from: Property, to: Property? = nil, coefficients: Coefficients = Coefficients(), relation: LayoutRelation = .equal) -> NSLayoutConstraint {

        from.view.car_translatesAutoresizingMaskIntoConstraints = false

        let item: LayoutItem = from.view
        let toItem: LayoutItem? = to?.view

        let layoutConstraint = NSLayoutConstraint(item: item,
                                                  attribute: from.attribute,
                                                  relatedBy: relation,
                                                  toItem: toItem,
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

    #endif

    internal func addConstraint(_ from: Compound, coefficients: [Coefficients]? = nil, to: Compound? = nil, relation: LayoutRelation = .equal) -> [NSLayoutConstraint] {
        var results: [NSLayoutConstraint] = []

        for i in 0..<from.properties.count {
            let n: Coefficients = coefficients?[i] ?? Coefficients()

            results.append(addConstraint(from.properties[i], to: to?.properties[i], coefficients: n, relation: relation))
        }

        return results
    }
}
