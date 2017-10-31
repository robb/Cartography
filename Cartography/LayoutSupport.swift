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

    public final class LayoutSupport: LayoutItem {
        let layoutGuide : UILayoutSupport

        init(layoutGuide: UILayoutSupport) {
            self.layoutGuide = layoutGuide
        }

        public func asProxy(context: Context) -> LayoutSupportProxy {
            return LayoutSupportProxy(context: context, item: self)
        }
    }

    public extension UIViewController {
        public var car_topLayoutGuide : LayoutSupport {
            get {
                return LayoutSupport(layoutGuide: self.topLayoutGuide)
            }
        }
        
        public var car_bottomLayoutGuide : LayoutSupport {
            get {
                return LayoutSupport(layoutGuide: self.bottomLayoutGuide)
            }
        }
    }

#endif
