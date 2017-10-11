//
//  Dimension.swift
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

public struct Dimension : Property, NumericalEquality, RelativeEquality, NumericalInequality, RelativeInequality, Addition, Multiplication {
    public let attribute: LayoutAttribute
    public let context: Context
    public let element: AnyObject

    internal init(_ context: Context, _ element: AnyObject, _ attribute: LayoutAttribute) {
        self.attribute = attribute
        self.context = context
        self.element = element
    }
}
