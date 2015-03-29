//
//  Point.swift
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

public struct Point: Compound {
    let context: Context
    let properties: [Property]

    internal init(_ context: Context, _ properties: [Property]) {
        self.context = context
        self.properties = properties
    }
}

// MARK: Equality

/// Declares a property equal to the result of an expression.
///
/// :param: lhs The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// :param: rhs The expression.
///
/// :returns: An `NSLayoutConstraint`.
///
public func == (lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value)
}

/// Declares a property equal to another property.
///
/// :param: lhs The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// :param: rhs The other property.
///
/// :returns: An `NSLayoutConstraint`.
///
public func == (lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs)
}

// MARK: Inequality

/// Declares a property less than or equal to another property.
///
/// :param: lhs The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// :param: rhs The other property.
///
/// :returns: An `NSLayoutConstraint`.
///
public func <= (lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

/// Declares a property greater than or equal to another property.
///
/// :param: lhs The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// :param: rhs The other property.
///
/// :returns: An `NSLayoutConstraint`.
///
public func >= (lhs: Point, rhs: Point) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, to: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}

/// Declares a property less than or equal to the result of an expression.
///
/// :param: lhs The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// :param: rhs The expression.
///
/// :returns: An `NSLayoutConstraint`.
///
public func <= (lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.LessThanOrEqual)
}

/// Declares a property greater than or equal to the result of an expression.
///
/// :param: lhs The affected property. The associated view will have
///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
/// :param: rhs The expression.
///
/// :returns: An `NSLayoutConstraint`.
///
public func >= (lhs: Point, rhs: Expression<Point>) -> [NSLayoutConstraint] {
    return lhs.context.addConstraint(lhs, coefficients: rhs.coefficients, to: rhs.value, relation: NSLayoutRelation.GreaterThanOrEqual)
}
