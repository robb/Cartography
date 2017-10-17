//
//  LayoutProxy+TypeErasure.swift
//  Cartography-iOS
//
//  Created by Vitor Travain on 17/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

import Foundation

struct AnyTopLayoutProxy: SupportsTopLayoutProxy {
    let proxy: SupportsTopLayoutProxy

    var context: Context {
        return proxy.context
    }

    var element: AnyObject {
        return proxy.element
    }

    init(_ proxy: SupportsTopLayoutProxy) {
        self.proxy = proxy
    }
}

struct AnyBottomLayoutProxy: SupportsBottomLayoutProxy {
    let proxy: SupportsBottomLayoutProxy

    var context: Context {
        return proxy.context
    }

    var element: AnyObject {
        return proxy.element
    }

    init(_ proxy: SupportsBottomLayoutProxy) {
        self.proxy = proxy
    }
}

struct AnyLeftLayoutProxy: SupportsLeftLayoutProxy {
    let proxy: SupportsLeftLayoutProxy

    var context: Context {
        return proxy.context
    }

    var element: AnyObject {
        return proxy.element
    }

    init(_ proxy: SupportsLeftLayoutProxy) {
        self.proxy = proxy
    }
}

struct AnyRightLayoutProxy: SupportsRightLayoutProxy {
    let proxy: SupportsRightLayoutProxy

    var context: Context {
        return proxy.context
    }

    var element: AnyObject {
        return proxy.element
    }

    init(_ proxy: SupportsRightLayoutProxy) {
        self.proxy = proxy
    }
}

struct AnyLeadingLayoutProxy: SupportsLeadingLayoutProxy {
    let proxy: SupportsLeadingLayoutProxy

    var context: Context {
        return proxy.context
    }

    var element: AnyObject {
        return proxy.element
    }

    init(_ proxy: SupportsLeadingLayoutProxy) {
        self.proxy = proxy
    }
}

struct AnyTrailingLayoutProxy: SupportsTrailingLayoutProxy {
    let proxy: SupportsTrailingLayoutProxy

    var context: Context {
        return proxy.context
    }

    var element: AnyObject {
        return proxy.element
    }

    init(_ proxy: SupportsTrailingLayoutProxy) {
        self.proxy = proxy
    }
}

struct AnyCenterXLayoutProxy: SupportsCenterXLayoutProxy {
    let proxy: SupportsCenterXLayoutProxy

    var context: Context {
        return proxy.context
    }

    var element: AnyObject {
        return proxy.element
    }

    init(_ proxy: SupportsCenterXLayoutProxy) {
        self.proxy = proxy
    }
}

struct AnyCenterYLayoutProxy: SupportsCenterYLayoutProxy {
    let proxy: SupportsCenterYLayoutProxy

    var context: Context {
        return proxy.context
    }

    var element: AnyObject {
        return proxy.element
    }

    init(_ proxy: SupportsCenterYLayoutProxy) {
        self.proxy = proxy
    }
}

struct AnyBaselineLayoutProxy: SupportsBaselineLayoutProxy {
    let proxy: SupportsBaselineLayoutProxy

    var context: Context {
        return proxy.context
    }

    var element: AnyObject {
        return proxy.element
    }

    init(_ proxy: SupportsBaselineLayoutProxy) {
        self.proxy = proxy
    }
}

struct AnyHorizontalDistributionLayoutProxy: SupportsLeadingLayoutProxy, SupportsTrailingLayoutProxy {
    let proxy: SupportsLeadingLayoutProxy & SupportsTrailingLayoutProxy

    var context: Context {
        return proxy.context
    }

    var element: AnyObject {
        return proxy.element
    }

    init(_ proxy: SupportsLeadingLayoutProxy & SupportsTrailingLayoutProxy) {
        self.proxy = proxy
    }
}

struct AnyLeftToRightDistributionLayoutProxy: SupportsLeftLayoutProxy, SupportsRightLayoutProxy {
    let proxy: SupportsLeftLayoutProxy & SupportsRightLayoutProxy

    var context: Context {
        return proxy.context
    }

    var element: AnyObject {
        return proxy.element
    }

    init(_ proxy: SupportsLeftLayoutProxy & SupportsRightLayoutProxy) {
        self.proxy = proxy
    }
}

struct AnyVerticalDistributionLayoutProxy: SupportsTopLayoutProxy, SupportsBottomLayoutProxy {
    let proxy: SupportsTopLayoutProxy & SupportsBottomLayoutProxy

    var context: Context {
        return proxy.context
    }

    var element: AnyObject {
        return proxy.element
    }

    init(_ proxy: SupportsTopLayoutProxy & SupportsBottomLayoutProxy) {
        self.proxy = proxy
    }
}
