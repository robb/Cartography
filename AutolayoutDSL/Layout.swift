//
//  Layout.swift
//  AutolayoutDSL
//
//  Created by Robert Böhnke on 17/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

import UIKit

class Layout {
    let width: Constrainable
    let height: Constrainable

    init(view: UIView) {
        self.width = Constrainable.Width(view)
        self.height = Constrainable.Height(view)
    }
}