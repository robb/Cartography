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
                Edge.Leading(view),
                Edge.Bottom(view),
                Edge.Trailing(view)
            ]
        }
    }
}

func inset(edges: Edges, all: Float) -> Expression<Edges> {
    return inset(edges, all, all, all, all)
}

func inset(edges: Edges, horizontal: Float, vertical: Float) -> Expression<Edges> {
    return inset(edges, vertical, horizontal, vertical, horizontal)
}

func inset(edges: Edges, top: Float, leading: Float, bottom: Float, trailing: Float) -> Expression<Edges> {
    return Expression(edges, [ Coefficients(1, top), Coefficients(1, leading), Coefficients(1, -bottom), Coefficients(1, -trailing) ])
}
