//
//  UIView+AutolayoutDSL.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import UIKit

extension UIView {
    func defineLayout(block: Layout -> ()) {
        block(Layout(view: self))

        self.layoutIfNeeded()
    }
}