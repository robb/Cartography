//
//  ViewProxy.swift
//  Cartography-iOS
//
//  Created by Vitor Travain on 10/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

public final class ViewProxy: SupportsPositioningLayoutProxy, SupportsBaselineLayoutProxy, AutoresizingMaskLayoutProxy {
    public var context: Context

    private let view: View
    public var item: AnyObject {
        return self.view
    }

    public var translatesAutoresizingMaskIntoConstraints: Bool {
        get {
            return view.translatesAutoresizingMaskIntoConstraints
        }
        set(value) {
            view.translatesAutoresizingMaskIntoConstraints = value
        }
    }

    public init(context: Context, view: View) {
        self.context = context
        self.view = view
    }

    public var superview: ViewProxy? {
        return view.superview?.asProxy(context: context)
    }

    #if os(iOS) || os(tvOS) || os(visionOS)
    @available(iOS, introduced: 11.0)
    @available(tvOS, introduced: 11.0)
    public var safeAreaLayoutGuide: LayoutGuideProxy {
        return view.safeAreaLayoutGuide.asProxy(context: context)
    }

    @available(iOS, introduced: 9.0)
    @available(tvOS, introduced: 9.0)
    public var layoutMarginsGuide: LayoutGuideProxy {
        return view.layoutMarginsGuide.asProxy(context: context)
    }

    @available(iOS, introduced: 9.0)
    @available(tvOS, introduced: 9.0)
    public var readableContentGuide: LayoutGuideProxy {
        return view.readableContentGuide.asProxy(context: context)
    }
    #endif
}

@available(iOS, introduced: 9.0)
@available(tvOS, introduced: 9.0)
@available(iOS, deprecated: 11.0, message: "The safe area is available on iOS 11+ via 'safeAreaLayoutGuide'!")
@available(tvOS, deprecated: 11.0, message: "The safe area is available on tvOS 11+ via 'safeAreaLayoutGuide'!")
extension ViewProxy {
    #if os(iOS) || os(tvOS) || os(visionOS)
    public var safeArea: LayoutGuideProxy {
        if #available(iOS 11, *), #available(tvOS 11, *) {
            return safeAreaLayoutGuide
        } else {
            return layoutMarginsGuide
        }
    }
    #endif
}
