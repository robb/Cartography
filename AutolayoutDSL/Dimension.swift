//
//  Dimension.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

enum Dimension : Property {
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
}

@infix func ==(lhs: Dimension, rhs: Float) {
    var predicate = Predicate()
    predicate.constant = rhs

    apply(predicate, lhs, nil)
}

@infix func ==(lhs: Float, rhs: Dimension) {
    rhs == lhs
}

@infix func ==(lhs: Dimension, rhs: Dimension) {
    apply(Predicate(), lhs, rhs)
}

@infix func <=(lhs: Dimension, rhs: Float) {
    var predicate = Predicate()
    predicate.constant = rhs
    predicate.relation = NSLayoutRelation.LessThanOrEqual

    apply(predicate, lhs, nil)
}

@infix func <=(lhs: Float, rhs: Dimension) {
    var predicate = Predicate()
    predicate.constant = lhs
    predicate.relation = NSLayoutRelation.GreaterThanOrEqual

    apply(predicate, rhs, nil)
}

@infix func >=(lhs: Dimension, rhs: Float) {
    var predicate = Predicate()
    predicate.constant = rhs
    predicate.relation = NSLayoutRelation.GreaterThanOrEqual

    apply(predicate, lhs, nil)
}

@infix func >=(lhs: Float, rhs: Dimension) {
    var predicate = Predicate()
    predicate.constant = lhs
    predicate.relation = NSLayoutRelation.LessThanOrEqual

    apply(predicate, rhs, nil)
}
