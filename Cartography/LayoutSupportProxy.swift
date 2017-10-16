//
//  LayoutSupportProxy.swift
//  Cartography-iOS
//
//  Created by Vitor Travain on 11/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit

public final class LayoutSupportProxy: SupportsHeightLayoutProxy, SupportsTopLayoutProxy, SupportsBottomLayoutProxy {
    public let context: Context
    public let element: AnyObject

    public init(context: Context, element: LayoutSupport) {
        self.context = context
        self.element = element.layoutGuide
    }
}
#endif
