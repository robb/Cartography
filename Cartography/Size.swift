//
//  Size.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

enum Size : Compound {
    case Size(UIView)

    var properties: Property[] {
        switch (self) {
            case let .Size(view):
                return [ Dimension.Width(view), Dimension.Height(view) ]
        }
    }
}
