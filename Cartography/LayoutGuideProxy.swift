//
//  LayoutGuideProxy.swift
//  Cartography
//
//  Created by Vitor Travain on 11/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

@available(iOS, introduced: 9.0)
@available(tvOS, introduced: 9.0)
@available(OSX, introduced: 10.11)
public final class LayoutGuideProxy: SupportsPositioningLayoutProxy {
    public let context: Context

    private let layoutGuide: LayoutGuide
    public var item: AnyObject {
        return layoutGuide
    }

    public init(context: Context, item: LayoutGuide) {
        self.context = context
        self.layoutGuide = item
    }

    public var owningView: ViewProxy? {
        return layoutGuide.owningView?.asProxy(context: context)
    }
}
