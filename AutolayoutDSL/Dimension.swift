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

struct Expression {
    let dimension: Dimension
    var constant: Float
    var multiplier: Float

    init(_ dimension: Dimension, multiplier: Float = 1, constant: Float = 0) {
        self.dimension = dimension
        self.multiplier = multiplier
        self.constant = constant
    }
}

// Equality

@infix func ==(lhs: Dimension, rhs: Float) {
    var predicate = Predicate()
    predicate.constant = rhs

    apply(predicate, lhs, nil)
}

@infix func ==(lhs: Float, rhs: Dimension) {
    rhs == lhs
}

@infix func ==(lhs: Dimension, rhs: Expression) {
    var predicate = Predicate()
    predicate.constant = rhs.constant
    predicate.multiplier = rhs.multiplier

    apply(predicate, lhs, rhs.dimension)
}

@infix func ==(lhs: Expression, rhs: Dimension) {
    rhs == lhs
}

@infix func ==(lhs: Dimension, rhs: Dimension) {
    apply(Predicate(), lhs, rhs)
}

// Inequality

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

@infix func <=(lhs: Dimension, rhs: Expression) {
    var predicate = Predicate()
    predicate.multiplier = rhs.multiplier
    predicate.constant = rhs.constant
    predicate.relation = NSLayoutRelation.LessThanOrEqual

    apply(predicate, lhs, nil)
}

@infix func <=(lhs: Expression, rhs: Dimension) {
    var predicate = Predicate()
    predicate.multiplier = lhs.multiplier
    predicate.constant = lhs.constant
    predicate.relation = NSLayoutRelation.GreaterThanOrEqual

    apply(predicate, rhs, nil)
}

@infix func >=(lhs: Dimension, rhs: Expression) {
    return rhs <= lhs
}

@infix func >=(lhs: Expression, rhs: Dimension) {
    return rhs <= lhs}

// Addition

@infix func +(lhs: Float, rhs: Dimension) -> Expression {
    return Expression(rhs, constant: lhs)
}

@infix func +(lhs: Dimension, rhs: Float) -> Expression {
    return rhs + lhs
}

@infix func +(lhs: Float, rhs: Expression) -> Expression {
    return Expression(rhs.dimension,
                      multiplier: rhs.multiplier,
                      constant: rhs.constant + lhs)
}

@infix func +(lhs: Expression, rhs: Float) -> Expression {
    return rhs + lhs
}

// Multiplication

@infix func *(lhs: Float, rhs: Dimension) -> Expression {
    return Expression(rhs, multiplier: lhs)
}

@infix func *(lhs: Dimension, rhs: Float) -> Expression {
    return rhs * lhs
}

@infix func *(lhs: Float, rhs: Expression) -> Expression {
    return Expression(rhs.dimension,
                      multiplier: rhs.multiplier * lhs,
                      constant: rhs.constant * lhs)
}

@infix func *(lhs: Expression, rhs: Float) -> Expression {
    return rhs * lhs
}
