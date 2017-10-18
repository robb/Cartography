//
//  Edge.swift
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

public struct Edge : Property, RelativeEquality, RelativeInequality, Addition, Multiplication {
    public let attribute: LayoutAttribute
    public let context: Context
    public let view: View
    public let needsSafeArea: Bool

    internal init(_ context: Context, _ view: View, _ attribute: LayoutAttribute, _ needsSafeArea: Bool) {
        self.attribute = attribute
        self.context = context
        self.view = view
        self.needsSafeArea = needsSafeArea
    }
}
