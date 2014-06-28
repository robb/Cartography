//
//  Point.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

enum Point : Compound {
    case Center(View)

    var properties: Property[] {
        switch (self) {
            case let .Center(view):
                return [ Edge.CenterX(view), Edge.CenterY(view) ]
        }
    }
}
