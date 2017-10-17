//
//  LayoutItem.swift
//  Cartography-iOS
//
//  Created by Vitor Travain on 10/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

public protocol LayoutItem: class {
    associatedtype ProxyType: LayoutProxy

    func asProxy(context: Context) -> ProxyType
}

extension LayoutItem {
    public func asProxy() -> ProxyType {
        return asProxy(context: Context())
    }
}
