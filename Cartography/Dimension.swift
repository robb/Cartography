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

public enum Dimension : Property, Equality, Inequality, Addition, Multiplication {
    case Width(LayoutProxy)
    case Height(LayoutProxy)

    public var attribute: NSLayoutAttribute {
        switch (self) {
            case .Width(_): return NSLayoutAttribute.Width
            case .Height(_): return NSLayoutAttribute.Height
        }
    }

    public var proxy: LayoutProxy {
        switch (self) {
            case let .Width(proxy): return proxy
            case let .Height(proxy): return proxy
        }
    }

    public var view: View {
        return proxy.view
    }
}
