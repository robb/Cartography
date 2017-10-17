//
//  ViewProxy.swift
//  Cartography-iOS
//
//  Created by Vitor Travain on 10/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

public final class ViewProxy: SupportsPositioningLayoutProxy, SupportsBaselineLayoutProxy {
    public var context: Context

    private let view: View
    public var element: AnyObject {
        return self.view
    }

    public init(context: Context, view: View) {
        self.context = context
        self.view = view
    }

    public var superview: ViewProxy? {
        guard let superview = self.view.superview else {
            return nil
        }

        return ViewProxy(context: context, view: superview)
    }

    #if os(iOS) || os(tvOS)
    @available(iOS, introduced: 11.0)
    @available(tvOS, introduced: 11.0)
    public var safeAreaLayoutGuide: LayoutGuideProxy {
        let layoutGuide = view.safeAreaLayoutGuide

        return LayoutGuideProxy(context: context, element: layoutGuide)
    }
    #endif
}
