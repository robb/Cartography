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

    public final class LayoutSupport: LayoutItem, SupportsHeightAnchor, SupportsTopAnchor, SupportsBottomAnchor {
        let layoutGuide : UILayoutSupport

        init(layoutGuide: UILayoutSupport) {
            self.layoutGuide = layoutGuide
        }

        public func asProxy(context: Context) -> LayoutSupportProxy {
            return LayoutSupportProxy(context: context, item: self)
        }
    }

    @available(iOS 10.0, macOS 10.12, tvOS 10.0, *)
    extension LayoutSupport {
        public var heightAnchor: NSLayoutDimension {
            self.layoutGuide.heightAnchor
        }
        
        public var topAnchor: NSLayoutYAxisAnchor {
            self.layoutGuide.topAnchor
        }
        
        public var bottomAnchor: NSLayoutYAxisAnchor {
            self.layoutGuide.bottomAnchor
        }
    }

    public extension UIViewController {
        var car_topLayoutGuide : LayoutSupport {
            get {
                return LayoutSupport(layoutGuide: self.topLayoutGuide)
            }
        }
        
        var car_bottomLayoutGuide : LayoutSupport {
            get {
                return LayoutSupport(layoutGuide: self.bottomLayoutGuide)
            }
        }
    }

#endif
