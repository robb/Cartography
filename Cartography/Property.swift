//
//  Property.swift
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

protocol Property {
    var attribute: NSLayoutAttribute { get }
    var proxy: LayoutProxy { get }
    var view: View { get }
}

