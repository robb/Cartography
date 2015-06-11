//
//  View.swift
//  Cartography
//
//  Created by Robert Böhnke on 26/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import Foundation

#if os(iOS)
    import UIKit
    public typealias View = UIView

    extension View {
        func car_updateLayout() {
            layoutIfNeeded()
        }

        public var car_translatesAutoresizingMaskIntoConstraints: Bool {
            get { return translatesAutoresizingMaskIntoConstraints }
            set { translatesAutoresizingMaskIntoConstraints = newValue }
        }
    }
#else
    import AppKit
    public typealias View = NSView

    extension View {
        func car_updateLayout() {
            (superview ?? self).layoutSubtreeIfNeeded()
        }

        public var car_translatesAutoresizingMaskIntoConstraints: Bool {
            get { return translatesAutoresizingMaskIntoConstraints }
            set { translatesAutoresizingMaskIntoConstraints = newValue }
        }
    }
#endif
