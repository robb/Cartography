//
//  Edge.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import AppKit

public enum Edge : Property, RelativeEquality, RelativeInequality, Addition, Multiplication {
    case Top(Context, View)
    case Right(Context, View)
    case Bottom(Context, View)
    case Left(Context, View)

    case Leading(Context, View)
    case Trailing(Context, View)

    case CenterX(Context, View)
    case CenterY(Context, View)

    case Baseline(Context, View)

    public var attribute: NSLayoutAttribute {
        switch (self) {
        case .Top(_): return .Top
        case .Right(_): return .Right
        case .Bottom(_): return .Bottom
        case .Left(_): return .Left
        case .Leading(_): return .Leading
        case .Trailing(_): return .Trailing
        case .CenterX(_): return .CenterX
        case .CenterY(_): return .CenterY
        case .Baseline(_): return .Baseline
        }
    }

    public var context: Context {
        switch (self) {
        case let .Top(context, _): return context
        case let .Right(context, _): return context
        case let .Bottom(context, _): return context
        case let .Left(context, _): return context
        case let .Leading(context, _): return context
        case let .Trailing(context, _): return context
        case let .CenterX(context, _): return context
        case let .CenterY(context, _): return context
        case let .Baseline(context, _): return context
        }
    }

    public var view: View {
        switch (self) {
        case let .Top(_, view): return view
        case let .Right(_, view): return view
        case let .Bottom(_, view): return view
        case let .Left(_, view): return view
        case let .Leading(_, view): return view
        case let .Trailing(_, view): return view
        case let .CenterX(_, view): return view
        case let .CenterY(_, view): return view
        case let .Baseline(_, view): return view
        }
    }
}
