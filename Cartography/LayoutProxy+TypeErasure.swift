//
//  LayoutProxy+TypeErasure.swift
//  Cartography-iOS
//
//  Created by Vitor Travain on 17/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

import Foundation

final class AnyTopLayoutProxy: SupportsTopLayoutProxy {
    let proxy: SupportsTopLayoutProxy

    var context: Context {
        return proxy.context
    }

    var item: AnyObject {
        return proxy.item
    }

    init(_ proxy: SupportsTopLayoutProxy) {
        self.proxy = proxy
    }
}

final class AnyBottomLayoutProxy: SupportsBottomLayoutProxy {
    let proxy: SupportsBottomLayoutProxy

    var context: Context {
        return proxy.context
    }

    var item: AnyObject {
        return proxy.item
    }

    init(_ proxy: SupportsBottomLayoutProxy) {
        self.proxy = proxy
    }
}

final class AnyLeftLayoutProxy: SupportsLeftLayoutProxy {
    let proxy: SupportsLeftLayoutProxy

    var context: Context {
        return proxy.context
    }

    var item: AnyObject {
        return proxy.item
    }

    init(_ proxy: SupportsLeftLayoutProxy) {
        self.proxy = proxy
    }
}

final class AnyRightLayoutProxy: SupportsRightLayoutProxy {
    let proxy: SupportsRightLayoutProxy

    var context: Context {
        return proxy.context
    }

    var item: AnyObject {
        return proxy.item
    }

    init(_ proxy: SupportsRightLayoutProxy) {
        self.proxy = proxy
    }
}

final class AnyLeadingLayoutProxy: SupportsLeadingLayoutProxy {
    let proxy: SupportsLeadingLayoutProxy

    var context: Context {
        return proxy.context
    }

    var item: AnyObject {
        return proxy.item
    }

    init(_ proxy: SupportsLeadingLayoutProxy) {
        self.proxy = proxy
    }
}

final class AnyTrailingLayoutProxy: SupportsTrailingLayoutProxy {
    let proxy: SupportsTrailingLayoutProxy

    var context: Context {
        return proxy.context
    }

    var item: AnyObject {
        return proxy.item
    }

    init(_ proxy: SupportsTrailingLayoutProxy) {
        self.proxy = proxy
    }
}

final class AnyCenterXLayoutProxy: SupportsCenterXLayoutProxy {
    let proxy: SupportsCenterXLayoutProxy

    var context: Context {
        return proxy.context
    }

    var item: AnyObject {
        return proxy.item
    }

    init(_ proxy: SupportsCenterXLayoutProxy) {
        self.proxy = proxy
    }
}

final class AnyCenterYLayoutProxy: SupportsCenterYLayoutProxy {
    let proxy: SupportsCenterYLayoutProxy

    var context: Context {
        return proxy.context
    }

    var item: AnyObject {
        return proxy.item
    }

    init(_ proxy: SupportsCenterYLayoutProxy) {
        self.proxy = proxy
    }
}

final class AnyBaselineLayoutProxy: SupportsBaselineLayoutProxy {
    let proxy: SupportsBaselineLayoutProxy

    var context: Context {
        return proxy.context
    }

    var item: AnyObject {
        return proxy.item
    }

    init(_ proxy: SupportsBaselineLayoutProxy) {
        self.proxy = proxy
    }
}

final class AnyHorizontalDistributionLayoutProxy: SupportsLeadingLayoutProxy, SupportsTrailingLayoutProxy {
    let proxy: SupportsLeadingLayoutProxy & SupportsTrailingLayoutProxy

    var context: Context {
        return proxy.context
    }

    var item: AnyObject {
        return proxy.item
    }

    init(_ proxy: SupportsLeadingLayoutProxy & SupportsTrailingLayoutProxy) {
        self.proxy = proxy
    }
}

final class AnyLeftToRightDistributionLayoutProxy: SupportsLeftLayoutProxy, SupportsRightLayoutProxy {
    let proxy: SupportsLeftLayoutProxy & SupportsRightLayoutProxy

    var context: Context {
        return proxy.context
    }

    var item: AnyObject {
        return proxy.item
    }

    init(_ proxy: SupportsLeftLayoutProxy & SupportsRightLayoutProxy) {
        self.proxy = proxy
    }
}

final class AnyVerticalDistributionLayoutProxy: SupportsTopLayoutProxy, SupportsBottomLayoutProxy {
    let proxy: SupportsTopLayoutProxy & SupportsBottomLayoutProxy

    var context: Context {
        return proxy.context
    }

    var item: AnyObject {
        return proxy.item
    }

    init(_ proxy: SupportsTopLayoutProxy & SupportsBottomLayoutProxy) {
        self.proxy = proxy
    }
}
