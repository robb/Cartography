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

    private let layoutGuide: UILayoutSupport
    public var item: AnyObject {
        return layoutGuide
    }

    public init(context: Context, item: LayoutSupport) {
        self.context = context
        self.layoutGuide = item.layoutGuide
    }
}
#endif
