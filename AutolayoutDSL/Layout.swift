//
//  Layout.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import UIKit

class Layout {
    let width: Dimension
    let height: Dimension

    init(view: UIView) {
        self.width = Dimension.Width(view)
        self.height = Dimension.Height(view)
    }
}