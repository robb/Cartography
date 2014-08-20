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
        func car_updateAutoLayoutConstraints() {
            layoutIfNeeded()
        }

        func car_setTranslatesAutoresizingMaskIntoConstraints(flag: Bool) {
            setTranslatesAutoresizingMaskIntoConstraints(flag)
        }
    }
#else
    import AppKit
    public typealias View = NSView

    extension View {
        func car_updateAutoLayoutConstraints() {
            superview?.layoutSubtreeIfNeeded()
        }

        func car_setTranslatesAutoresizingMaskIntoConstraints(flag: Bool) {
            translatesAutoresizingMaskIntoConstraints = flag
        }
    }
#endif
