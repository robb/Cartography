//
//  Extensions.swift
//  Cartography
//
//  Created by Robert Böhnke on 22/01/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

internal extension Dictionary {
    init(_ pairs: [Element]) {
        self.init()

        for (key, value) in pairs {
            self[key] = value
        }
    }
}

public protocol Number {
    var doubleValue: Double { get }
}

extension Float: Number {
    public var doubleValue: Double {
        return Double(self)
    }
}

extension Double: Number {
    public var doubleValue: Double {
        return self
    }
}

extension CGFloat: Number {
    public var doubleValue: Double {
        return Double(self)
    }
}
