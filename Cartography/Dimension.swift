//
//  Dimension.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

public enum Dimension : Property, NumericalEquality, RelativeEquality, NumericalInequality, RelativeInequality, Addition, Multiplication {
    case Width(Context, View)
    case Height(Context, View)

    public var attribute: NSLayoutAttribute {
        switch (self) {
            case .Width(_): return NSLayoutAttribute.Width
            case .Height(_): return NSLayoutAttribute.Height
        }
    }

    public var context: Context {
        switch (self) {
            case let .Width(context, _): return context
            case let .Height(context, _): return context
        }
    }

    public var view: View {
        switch (self) {
            case let .Width(_, view): return view
            case let .Height(_, view): return view
        }
    }
}
