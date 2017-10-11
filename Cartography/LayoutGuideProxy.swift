//
//  LayoutGuideProxy.swift
//  Cartography
//
//  Created by corujautx on 11/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
@available(iOS, introduced: 9.0)
@available(tvOS, introduced: 9.0)
public final class LayoutGuideProxy: SupportsPositioningLayoutProxy {
    public let context: Context
    public let element: AnyObject

    init(context: Context, element: UILayoutGuide) {
        self.context = context
        self.element = element
    }
}
#endif
