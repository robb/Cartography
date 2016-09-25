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
        
        public var topLayoutGuideCartography : LayoutSupport {
            get {
                return LayoutSupport(layoutGuide: self.topLayoutGuide, attribute: .bottom)
            }
        }
        
        public var bottomLayoutGuideCartography : LayoutSupport {
            get {
                return LayoutSupport(layoutGuide: self.bottomLayoutGuide, attribute: .top)
            }
        }
    }

#endif
