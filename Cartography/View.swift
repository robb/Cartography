//
//  View.swift
//  Cartography
//
//  Created by Robert Böhnke on 26/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS)
    import UIKit
    public typealias View = UIView

#else
    import AppKit
    public typealias View = NSView
#endif

extension View {
    public var car_translatesAutoresizingMaskIntoConstraints: Bool {
        get { return translatesAutoresizingMaskIntoConstraints }
        set { translatesAutoresizingMaskIntoConstraints = newValue }
    }
    
    func ancestors() -> AnyIterator<View> {
        var current : View? = self
        return AnyIterator {
            defer {
                current = self.superview
            }
            return current
        }
    }
}
