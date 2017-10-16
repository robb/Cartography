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

    extension UIView: LayoutElement {
        public func asProxy(context: Context) -> ViewProxy {
            self.translatesAutoresizingMaskIntoConstraints = false

            return ViewProxy(context: context, view: self)
        }
    }
#else
    import AppKit
    public typealias View = NSView

    extension NSView: LayoutElement {
        public func asProxy(context: Context) -> ViewProxy {
            self.translatesAutoresizingMaskIntoConstraints = false

            return ViewProxy(context: context, view: self)
        }
    }
#endif
