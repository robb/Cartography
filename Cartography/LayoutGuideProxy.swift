//
//  LayoutGuideProxy.swift
//  Cartography
//
//  Created by Vitor Travain on 11/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit

@available(iOS, introduced: 9.0)
@available(tvOS, introduced: 9.0)
public final class LayoutGuideProxy: SupportsPositioningLayoutProxy {
    public let context: Context

    private let layoutGuide: UILayoutGuide
    public var element: AnyObject {
        return layoutGuide
    }

    public init(context: Context, element: UILayoutGuide) {
        self.context = context
        self.layoutGuide = element
    }

    public var owningView: ViewProxy? {
        guard let owningView = layoutGuide.owningView else {
            return nil
        }

        return ViewProxy(context: context, view: owningView)
    }
}
#endif
