//
//  Edge.swift
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
            case let .Top(view): return NSLayoutAttribute.Top
            case let .Right(view): return NSLayoutAttribute.Right
            case let .Bottom(view): return NSLayoutAttribute.Bottom
            case let .Left(view): return NSLayoutAttribute.Left

            case let .Leading(view): return NSLayoutAttribute.Leading
            case let .Trailing(view): return NSLayoutAttribute.Trailing

            case let .CenterX(view): return NSLayoutAttribute.CenterX
            case let .CenterY(view): return NSLayoutAttribute.CenterY

            case let .Baseline(view): return NSLayoutAttribute.Baseline
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
