//
//  LayoutItem.swift
//  Cartography-iOS
//
//  Created by Yusuke Morishia on 2017/10/15.
//  Copyright © 2017年 Robert Böhnke. All rights reserved.
//
#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

internal protocol LayoutItem: class {}

extension View: LayoutItem {}

#if os(iOS) || os(tvOS)
@available(iOS 9.0, tvOS 9.0, *)
extension UILayoutGuide: LayoutItem {}
#endif
