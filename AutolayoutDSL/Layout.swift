//
//  Layout.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import UIKit

class Layout {
    let width: Property
    let height: Property

    init(view: UIView) {
        self.width = Property.Width(view)
        self.height = Property.Height(view)
    }
}