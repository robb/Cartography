//
//  Edges.swift
//  Cartography
//
//  Created by Robert Böhnke on 19/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

enum Edges : Compound {
    case Edges(UIView)

    var properties: Property[] {
    switch (self) {
        case let .Edges(view):
            return [
                Edge.Top(view),
                Edge.Right(view),
                Edge.Bottom(view),
                Edge.Left(view)
            ]
        }
    }
}
