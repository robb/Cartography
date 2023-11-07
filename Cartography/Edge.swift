//
//  Edge.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit
#else
import AppKit
#endif

public struct Edge : Property, RelativeEquality, RelativeInequality, Addition, Multiplication {
    public let attribute: LayoutAttribute
    public let context: Context
    public let item: AnyObject

    internal init(_ context: Context, _ item: AnyObject, _ attribute: LayoutAttribute) {
        self.attribute = attribute
        self.context = context
        self.item = item
    }
}
