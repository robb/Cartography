//
//  Constrainable.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

struct Predicate {
    var relation: NSLayoutRelation = NSLayoutRelation.Equal
    var multiplier: Float = 1
    var constant: Float = 0
    var priority: UILayoutPriority? = nil
}

func commonSuperview(a: UIView, b: UIView?) -> UIView? {
    if (b == nil) {
        return a;
    } else if (a.superview == b) {
        return b;
    } else if (a == b!.superview) {
        return a;
    } else if (a.superview == b!.superview) {
        return a.superview;
    }

    return nil;
}

enum Constrainable {
    case Width(UIView)
    case Height(UIView)

    var view: UIView {
        switch (self) {
            case let .Width(view): return view
            case let .Height(view): return view
        }
    }

    var attribute: NSLayoutAttribute {
        switch (self) {
            case .Width(_): return NSLayoutAttribute.Width
            case .Height(_): return NSLayoutAttribute.Height
        }
    }

    func apply(predicate: Predicate, to: Constrainable?, toAttribute: NSLayoutAttribute) -> NSLayoutConstraint {
        self.view.setTranslatesAutoresizingMaskIntoConstraints(false)

        let superview = commonSuperview(self.view, to?.view)

        let constraint = NSLayoutConstraint(item: self.view,
                                            attribute: self.attribute,
                                            relatedBy: predicate.relation,
                                            toItem: to?.view,
                                            attribute: toAttribute,
                                            multiplier: predicate.multiplier,
                                            constant: predicate.constant)

        if let priority = predicate.priority {
            constraint.priority = priority
        }

        superview?.addConstraint(constraint)

        return constraint
    }
}

@infix func ==(lhs: Constrainable, rhs: Float) {
    var predicate = Predicate()
    predicate.constant = rhs

    lhs.apply(predicate, to: nil, toAttribute: NSLayoutAttribute.NotAnAttribute)
}
