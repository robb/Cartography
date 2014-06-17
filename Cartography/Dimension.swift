//
//  Dimension.swift
//  Cartography
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
