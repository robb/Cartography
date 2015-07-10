//
//  TestView.swift
//  Cartography
//
//  Created by Robert Böhnke on 21/03/15.
//  Copyright (c) 2015 Robert Böhnke. All rights reserved.
//

import Cartography

class TestView: View {
    override init(frame: CGRect) {
        super.init(frame: frame)

        #if os(iOS)
        setTranslatesAutoresizingMaskIntoConstraints(false)
        #else
        translatesAutoresizingMaskIntoConstraints = false
        #endif
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

#if os(iOS)
    var car_constraints: [NSLayoutConstraint] {
        return constraints() as! [NSLayoutConstraint]
    }
#else
    var car_constraints: [NSLayoutConstraint] {
        return constraints as! [NSLayoutConstraint]
    }

    override var flipped: Bool {
        return true
    }

    func layoutIfNeeded() {
        (superview ?? self).layoutSubtreeIfNeeded()
    }
#endif
}
