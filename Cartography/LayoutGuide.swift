//
//  LayoutGuide.swift
//  Cartography
//
//  Created by corujautx on 11/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit

@available(iOS, introduced: 9.0)
@available(tvOS, introduced: 9.0)
extension UILayoutGuide: LayoutElement {

    @available(iOS, introduced: 9.0)
    @available(tvOS, introduced: 9.0)
    public func asProxy(context: Context) -> LayoutGuideProxy {
        return LayoutGuideProxy(context: context, element: self)
    }
}

#endif
