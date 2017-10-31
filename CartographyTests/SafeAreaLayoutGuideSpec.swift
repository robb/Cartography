//
//  SafeAreaLayoutGuideSpec.swift
//  Cartography
//
//  Created by Vitor Travain on 17/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import Cartography

@available(iOS, introduced: 11.0)
@available(tvOS, introduced: 11.0)
final class SafeAreaLayoutGuideSpec: QuickSpec {
    override func spec() {
        describe("SafeAreaLayoutGuide") {
            var superview: UIView!
            var view: UIView!

            beforeEach {
                superview = TestView(frame: UIScreen.main.bounds)
                view = TestView(frame: CGRect.zero)

                superview.addSubview(view)
            }

            it("Views should align to edges") {
                constrain(view) { view in
                    view.edges == view.superview!.safeAreaLayoutGuide.edges
                }

                superview.layoutIfNeeded()

                expect(view.frame.minX) == (superview.safeAreaLayoutGuide.layoutFrame.minX)
                expect(view.frame.minY) == (superview.safeAreaLayoutGuide.layoutFrame.maxX)
                expect(view.frame.width) == (superview.safeAreaLayoutGuide.layoutFrame.width)
                expect(view.frame.height) == (superview.safeAreaLayoutGuide.layoutFrame.height)
            }

            it("View should center in safe area") {
                constrain(view) { view in
                    view.center == view.superview!.safeAreaLayoutGuide.center
                    view.width == 200
                    view.height == 200
                }

                superview.layoutIfNeeded()

                expect(view.frame.midX) == (superview.safeAreaLayoutGuide.layoutFrame.midX)
                expect(view.frame.midY) == (superview.safeAreaLayoutGuide.layoutFrame.midY)
                expect(view.frame.width) == 200
                expect(view.frame.height) == 200
            }
        }
    }
}
