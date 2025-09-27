//
//  Dimension.swift
//  Cartography
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

public struct Dimension : Property, NumericalEquality, RelativeEquality, NumericalInequality, RelativeInequality, Addition, Multiplication {
    public let attribute: LayoutAttribute
    public let context: Context
    public let item: AnyObject
    
    private let _anchor: AnyObject?
    
    internal init(_ context: Context, _ item: AnyObject, _ attribute: LayoutAttribute) {
        self.attribute = attribute
        self.context = context
        self.item = item
        self._anchor = nil
    }
    
    @available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
    internal init(_ context: Context, _ anchor: NSLayoutDimension) {
        self.attribute = .notAnAttribute
        self.context = context
        self.item = NSNull()
        self._anchor = anchor
    }
    
    @available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
    internal var anchor: NSLayoutDimension? {
        if let anchor = self._anchor as? NSLayoutDimension { return anchor }
        
        if attribute == .width, let item = item as? SupportsWidthAnchor {
            return item.widthAnchor
        }
        else if attribute == .height, let item = item as? SupportsHeightAnchor {
            return item.heightAnchor
        }
        else {
            return nil
        }
    }
}
