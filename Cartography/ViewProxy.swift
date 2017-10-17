//
//  ViewProxy.swift
//  Cartography-iOS
//
//  Created by Vitor Travain on 10/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

public final class ViewProxy: SupportsPositioningLayoutProxy, SupportsBaselineLayoutProxy {
    public var context: Context
    public var element: AnyObject

    public init(context: Context, view: View) {
        self.context = context
        self.element = view
    }

    public var superview: ViewProxy? {
        guard let view = element as? View else {
            fatalError("This wasn't supposed to happen")
        }

        guard let superview = view.superview else {
            return nil
        }

        return ViewProxy(context: context, view: superview)
    }

    #if os(iOS) || os(tvOS)
    @available(iOS, introduced: 11.0)
    @available(tvOS, introduced: 11.0)
    public var safeAreaLayoutGuide: LayoutGuideProxy {
        guard let view = element as? UIView else {
            fatalError("This wasn't supposed to happen")
        }

        let layoutGuide = view.safeAreaLayoutGuide

        return LayoutGuideProxy(context: context, element: layoutGuide)
    }
    #endif
}
