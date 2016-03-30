//
//  LayoutSupport.swift
//  Cartography
//
//  Created by Timothy Chilvers on 30/03/2016.
//  Copyright © 2016 Robert Böhnke. All rights reserved.
//

import Foundation

#if os(iOS) || os(tvOS)
    import UIKit

    public struct LayoutSupport {
        let layoutGuide : UILayoutSupport
        let attribute : NSLayoutAttribute
    }

    public extension UIViewController {
        
        public func topLayoutGuideCartography() -> LayoutSupport {
            return LayoutSupport(layoutGuide: topLayoutGuide, attribute: .Bottom)
        }
        public func bottomLayoutGuideCartography() -> LayoutSupport{
            return LayoutSupport(layoutGuide: bottomLayoutGuide, attribute: .Top)
        }
    }

#endif
