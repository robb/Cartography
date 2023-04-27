//
//  AnchorSupport.swift
//  Cartography
//
//  Created by Jayson Rhynas on 2023-04-27.
//  Copyright © 2023 Robert Böhnke. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol AnchorSupport: AnyObject {}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsTopAnchor: AnchorSupport {
    var topAnchor: NSLayoutYAxisAnchor { get }
}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsBottomAnchor: AnchorSupport {
    var bottomAnchor: NSLayoutYAxisAnchor { get }
}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsRightAnchor: AnchorSupport {
    var rightAnchor: NSLayoutXAxisAnchor { get }
}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsLeftAnchor: AnchorSupport {
    var leftAnchor: NSLayoutXAxisAnchor { get }
}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsLeadingAnchor: AnchorSupport {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsTrailingAnchor: AnchorSupport {
    var trailingAnchor: NSLayoutXAxisAnchor { get }
}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsEdgeAnchors: SupportsTopAnchor, SupportsBottomAnchor, SupportsLeadingAnchor, SupportsTrailingAnchor, SupportsLeftAnchor, SupportsRightAnchor {}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsCenterXAnchor: AnchorSupport {
    var centerXAnchor: NSLayoutXAxisAnchor { get }
}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsCenterYAnchor: AnchorSupport {
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsCenteringAnchors: SupportsCenterXAnchor, SupportsCenterYAnchor {}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsWidthAnchor: AnchorSupport {
    var widthAnchor: NSLayoutDimension { get }
}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsHeightAnchor: AnchorSupport {
    var heightAnchor: NSLayoutDimension { get }
}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsSizeAnchors: SupportsWidthAnchor, SupportsHeightAnchor {}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsBaselineAnchors: AnchorSupport {
    var firstBaselineAnchor: NSLayoutYAxisAnchor { get }
    
    var lastBaselineAnchor: NSLayoutYAxisAnchor { get }
}

@available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
public protocol SupportsPositioningAnchors: SupportsEdgeAnchors, SupportsSizeAnchors, SupportsCenteringAnchors {}
