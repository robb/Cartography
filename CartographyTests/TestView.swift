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

        translatesAutoresizingMaskIntoConstraints = false
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

#if os(OSX)
    override var isFlipped: Bool {
        return true
    }

    func layoutIfNeeded() {
        (superview ?? self).layoutSubtreeIfNeeded()
    }
#endif
}

#if os(iOS) || os(tvOS)
class TestWindow: UIWindow {

}
#else
class TestWindow: TestView {

}
#endif
