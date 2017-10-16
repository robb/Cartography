//
//  LayoutGuideSpec.swift
//  Cartography-iOS
//
//  Created by corujautx on 16/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Cartography

@available(iOS, introduced: 9.0)
final class LayoutGuideSpec: QuickSpec {
    override func spec() {
        var view: UIView!
        var layoutGuide: UILayoutGuide!

        beforeEach {
            view = TestView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
            layoutGuide = UILayoutGuide()

            constrain(view) { view in
                view.width == 400.0
                view.height == 400.0
            }

            view.addLayoutGuide(layoutGuide)
        }

        describe("LayoutGuideProxy") {
            it("should support relative equalities") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.edges == layoutGuide.owningView!.edges
                }

                view.layoutIfNeeded()

                expect(layoutGuide.layoutFrame.origin.x) == 0
                expect(layoutGuide.layoutFrame.origin.y) == 0
                expect(layoutGuide.layoutFrame.width) == 400
                expect(layoutGuide.layoutFrame.height) == 400
            }

            it("should support inequalities") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.top >= layoutGuide.owningView!.top
                    layoutGuide.bottom <= layoutGuide.owningView!.bottom

                    layoutGuide.left >= layoutGuide.owningView!.left
                    layoutGuide.left <= layoutGuide.owningView!.left

                    layoutGuide.width == 200
                    layoutGuide.height == 200
                }

                view.layoutIfNeeded()

                expect(layoutGuide.layoutFrame.origin.x) == 0
                expect(layoutGuide.layoutFrame.origin.y) == 0
                expect(layoutGuide.layoutFrame.width) == 200
                expect(layoutGuide.layoutFrame.height) == 200
            }

            it("should support addition") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.leading == layoutGuide.owningView!.leading + 10
                }

                view.layoutIfNeeded()

                expect(layoutGuide.layoutFrame.minX) == 10
            }

            it("should support subtraction") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.trailing == layoutGuide.owningView!.trailing - 10
                }

                view.layoutIfNeeded()

                expect(layoutGuide.layoutFrame.maxX) == 390
            }

            it("should support multiplication") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.width == 0.5 * layoutGuide.owningView!.width
                }

                view.layoutIfNeeded()

                expect(layoutGuide.layoutFrame.width) == 0.5 * view.frame.width
            }

            it("should support division") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.width == layoutGuide.owningView!.width / 2
                }

                view.layoutIfNeeded()

                expect(layoutGuide.layoutFrame.width) == view.frame.width / 2
            }

            it("should support centering") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.center == layoutGuide.owningView!.center
                }

                view.layoutIfNeeded()

                expect(layoutGuide.layoutFrame.midX) == 200
                expect(layoutGuide.layoutFrame.midY) == 200
            }
        }
    }
}
