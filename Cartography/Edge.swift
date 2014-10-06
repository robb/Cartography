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

public enum Edge : Property, Equality, Inequality, Addition {
    case Top(LayoutProxy)
    case Right(LayoutProxy)
    case Bottom(LayoutProxy)
    case Left(LayoutProxy)

    case Leading(LayoutProxy)
    case Trailing(LayoutProxy)

    case CenterX(LayoutProxy)
    case CenterY(LayoutProxy)

    case Baseline(LayoutProxy)

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

    public var proxy: LayoutProxy {
        switch (self) {
            case let .Top(proxy): return proxy
            case let .Right(proxy): return proxy
            case let .Bottom(proxy): return proxy
            case let .Left(proxy): return proxy

            case let .Leading(proxy): return proxy
            case let .Trailing(proxy): return proxy

            case let .CenterX(proxy): return proxy
            case let .CenterY(proxy): return proxy

            case let .Baseline(proxy): return proxy
        }
    }

    public var view: View {
        return proxy.view
    }
}
