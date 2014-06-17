//
//  Edge.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

enum Edge : Property {
    case Top(UIView)
    case Right(UIView)
    case Bottom(UIView)
    case Left(UIView)

    case Leading(UIView)
    case Trailing(UIView)

    case CenterX(UIView)
    case CenterY(UIView)

    var view: UIView {
        switch (self) {
            case let .Top(view): return view
            case let .Right(view): return view
            case let .Bottom(view): return view
            case let .Left(view): return view

            case let .Leading(view): return view
            case let .Trailing(view): return view

            case let .CenterX(view): return view
            case let .CenterY(view): return view
        }
    }

    var attribute: NSLayoutAttribute {
        switch (self) {
            case let .Top(view): return NSLayoutAttribute.Top
            case let .Right(view): return NSLayoutAttribute.Right
            case let .Bottom(view): return NSLayoutAttribute.Bottom
            case let .Left(view): return NSLayoutAttribute.Left

            case let .Leading(view): return NSLayoutAttribute.Leading
            case let .Trailing(view): return NSLayoutAttribute.Trailing

            case let .CenterX(view): return NSLayoutAttribute.CenterX
            case let .CenterY(view): return NSLayoutAttribute.CenterY
        }
    }
}
