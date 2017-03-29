//
//  Property.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

public protocol Property {
    var attribute: NSLayoutAttribute { get }
    var context: Context { get }
    var view: View { get }
}

// MARK: Equality

/// Properties conforming to this protocol can use the `==` operator with
/// numerical constants.
public protocol NumericalEquality : Property { }

extension NumericalEquality {
    /// Declares a property equal to a numerical constant.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The numerical constant.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///
    @discardableResult static public func ==(lhs: NumericalEquality, rhs: CGFloat) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, coefficients: Coefficients(1, rhs))
    }
}

/// Properties conforming to this protocol can use the `==` operator with other
/// properties of the same type.
public protocol RelativeEquality : Property { }

extension RelativeEquality {
    /// Declares a property equal to a the result of an expression.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The expression.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///
    @discardableResult static public func ==(lhs: Self, rhs: Expression<Self>) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, to: rhs.value, coefficients: rhs.coefficients[0])
    }
    
    /// Declares a property equal to another property.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The other property.
    ///
    @discardableResult static public func ==(lhs: Self, rhs: Self) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, to: rhs)
    }
}

// MARK: Inequality

/// Properties conforming to this protocol can use the `<=` and `>=` operators
/// with numerical constants.
public protocol NumericalInequality : Property { }

extension NumericalInequality {
    /// Declares a property less than or equal to a numerical constant.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The numerical constant.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///
    @discardableResult static public func <= (lhs: NumericalInequality, rhs: CGFloat) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, coefficients: Coefficients(1, rhs), relation: .lessThanOrEqual)
    }
    
    /// Declares a property greater than or equal to a numerical constant.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The numerical constant.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///
    @discardableResult static public func >= (lhs: NumericalInequality, rhs: CGFloat) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, coefficients: Coefficients(1, rhs), relation: .greaterThanOrEqual)
    }
}
/// Properties conforming to this protocol can use the `<=` and `>=` operators
/// with other properties of the same type.
public protocol RelativeInequality : Property { }

extension RelativeInequality {
    /// Declares a property less than or equal to another property.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The other property.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///
    @discardableResult static public func <=(lhs: Self, rhs: Self) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, to: rhs, relation: .lessThanOrEqual)
    }
    
    /// Declares a property greater than or equal to another property.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The other property.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///
    @discardableResult static public func >=(lhs: Self, rhs: Self) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, to: rhs, relation: .greaterThanOrEqual)
    }
    
    /// Declares a property less than or equal to the result of an expression.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The other property.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///
    @discardableResult static public func <=(lhs: Self, rhs: Expression<Self>) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, to: rhs.value, coefficients: rhs.coefficients[0], relation: .lessThanOrEqual)
    }
    
    /// Declares a property greater than or equal to the result of an expression.
    ///
    /// - parameter lhs: The affected property. The associated view will have
    ///             `translatesAutoresizingMaskIntoConstraints` set to `false`.
    /// - parameter rhs: The other property.
    ///
    /// - returns: An `NSLayoutConstraint`.
    ///
    @discardableResult static public func >=(lhs: Self, rhs: Expression<Self>) -> NSLayoutConstraint {
        return lhs.context.addConstraint(lhs, to: rhs.value, coefficients: rhs.coefficients[0], relation: .greaterThanOrEqual)
    }
}

// MARK: Addition

public protocol Addition : Property { }

extension Addition {
    static public func +(c: CGFloat, rhs: Self) -> Expression<Self> {
        return Expression(rhs, [ Coefficients(1, c) ])
    }

    static public func +(lhs: Self, rhs: CGFloat) -> Expression<Self> {
        return rhs + lhs
    }

    static public func -(lhs: Self, rhs: CGFloat) -> Expression<Self> {
        return rhs - lhs
    }

    static public func -(c: CGFloat, rhs: Self) -> Expression<Self> {
        return Expression(rhs, [ Coefficients(1, -c) ])
    }
}

extension Expression where T : Addition {
    static public func +(c: CGFloat, rhs: Expression) -> Expression {
        return Expression(rhs.value, rhs.coefficients.map { $0 + c })
    }

    static public func +(lhs: Expression, rhs: CGFloat) -> Expression {
        return rhs + lhs
    }

    static public func -(c: CGFloat, rhs: Expression) -> Expression {
        return Expression(rhs.value, rhs.coefficients.map { $0 - c})
    }

    static public func -(lhs: Expression, rhs: CGFloat) -> Expression {
        return rhs - lhs
    }
}

#if os(iOS) || os(tvOS)
extension LayoutSupport {
    static public func +(lhs: LayoutSupport, c: CGFloat) -> Expression<LayoutSupport> {
        return Expression(lhs, [Coefficients(1, c)])
    }
    
    static public func -(lhs: LayoutSupport, c: CGFloat) -> Expression<LayoutSupport> {
        return lhs + (-c)
    }
}
#endif
// MARK: Multiplication

public protocol Multiplication : Property { }

extension Multiplication {
    static public func *(m: CGFloat, rhs: Self) -> Expression<Self> {
        return Expression(rhs, [ Coefficients(m, 0) ])
    }

    static public func *(lhs: Self, rhs: CGFloat) -> Expression<Self> {
        return rhs * lhs
    }

    static public func /(lhs: Self, rhs: CGFloat) -> Expression<Self> {
        return lhs * (1 / rhs)
    }
}

extension Expression where T : Multiplication {
    static public func *(m: CGFloat, rhs: Expression) -> Expression {
        return Expression(rhs.value, rhs.coefficients.map { $0 * m })
    }

    static public func *(lhs: Expression, rhs: CGFloat) -> Expression {
        return rhs * lhs
    }

    static public func /(lhs: Expression, rhs: CGFloat) -> Expression {
        return lhs * (1 / rhs)
    }
}
