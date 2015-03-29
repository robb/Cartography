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

    // The following properties are iOS exclusive and cannot have their
    // `attribute` resolved on OS X.
    case FirstBaseline(Context, View)
    case LeftMargin(Context, View)
    case RightMargin(Context, View)
    case TopMargin(Context, View)
    case BottomMargin(Context, View)
    case LeadingMargin(Context, View)
    case TrailingMargin(Context, View)
    case CenterXWithinMargins(Context, View)
    case CenterYWithinMargins(Context, View)

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

        // Swift does not let me mix `#if` statements with `case` statements as
        // of Xcode 6.2
        default:
            #if os(iOS)
            // Only on iOS we're able to look up the appropriate properties for
            // the remaining cases.
            switch (self) {
            case .FirstBaseline(_): return .FirstBaseline
            case .LeftMargin(_): return .LeftMargin
            case .RightMargin(_): return .RightMargin
            case .TopMargin(_): return .TopMargin
            case .BottomMargin(_): return .BottomMargin
            case .LeadingMargin(_): return .LeadingMargin
            case .TrailingMargin(_): return .TrailingMargin
            case .CenterXWithinMargins(_): return .CenterXWithinMargins
            case .CenterYWithinMargins(_): return .CenterYWithinMargins
            default:
                fatalError("Unexpected case \(self).")
                return .NotAnAttribute
            }
            #else
            // Since `LayoutProxy` does not expose them on OS X, we should never
            // have to resolve them.
            fatalError("\(self) must not be used on OS X.")
            return .NotAnAttribute
            #endif
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

        // iOS Only
        case let .FirstBaseline(context, _): return context
        case let .LeftMargin(context, _): return context
        case let .RightMargin(context, _): return context
        case let .TopMargin(context, _): return context
        case let .BottomMargin(context, _): return context
        case let .LeadingMargin(context, _): return context
        case let .TrailingMargin(context, _): return context
        case let .CenterXWithinMargins(context, _): return context
        case let .CenterYWithinMargins(context, _): return context
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

        // iOS Only
        case let .FirstBaseline(_, view): return view
        case let .LeftMargin(_, view): return view
        case let .RightMargin(_, view): return view
        case let .TopMargin(_, view): return view
        case let .BottomMargin(_, view): return view
        case let .LeadingMargin(_, view): return view
        case let .TrailingMargin(_, view): return view
        case let .CenterXWithinMargins(_, view): return view
        case let .CenterYWithinMargins(_, view): return view
        }
    }
}
