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

@available(iOS, introduced: 9.0)
@available(iOS, introduced: 9.0)
final class ViewLayoutGuideSpec: QuickSpec {
    override func spec() {
        describe("Layout margin guide") {
            var superview: UIView!
            var view: UIView!

            beforeEach {
                superview = UIView(frame: UIScreen.main.bounds)
                view = UIView(frame: .zero)

                superview.addSubview(view)
            }

            it("Views should align to edges within margins") {
                constrain(view) { view in
                    view.edges == view.superview!.layoutMarginsGuide.edges
                }

                superview.layoutIfNeeded()

                expect(view.frame.minX) == superview.layoutMarginsGuide.layoutFrame.minX
                expect(view.frame.minY) == superview.layoutMarginsGuide.layoutFrame.minY
                expect(view.frame.width) == superview.layoutMarginsGuide.layoutFrame.width
                expect(view.frame.height) == superview.layoutMarginsGuide.layoutFrame.height
            }

            it("Views should center within margins") {
                constrain(view) { view in
                    view.center == view.superview!.layoutMarginsGuide.center

                    view.width == 200
                    view.height == 200
                }

                superview.layoutIfNeeded()

                expect(view.frame.midX) == (superview.layoutMarginsGuide.layoutFrame.midX)
                expect(view.frame.midY) == (superview.layoutMarginsGuide.layoutFrame.midY)
                expect(view.frame.width) == 200
                expect(view.frame.height) == 200
            }
        }

        describe("Readable content guide") {
            var superview: UIView!
            var view: UIView!

            beforeEach {
                superview = UIView(frame: UIScreen.main.bounds)
                view = UIView(frame: .zero)

                superview.addSubview(view)
            }

            it("Views should align to edges within readable margins") {
                constrain(view) { view in
                    view.edges == view.superview!.readableContentGuide.edges
                }

                superview.layoutIfNeeded()

                expect(view.frame.minX) == superview.readableContentGuide.layoutFrame.minX
                expect(view.frame.minY) == superview.readableContentGuide.layoutFrame.minY
                expect(view.frame.width) == superview.readableContentGuide.layoutFrame.width
                expect(view.frame.height) == superview.readableContentGuide.layoutFrame.height
            }

            it("Views should center within readable margins") {
                constrain(view) { view in
                    view.center == view.superview!.readableContentGuide.center

                    view.width == 200
                    view.height == 200
                }

                superview.layoutIfNeeded()

                expect(view.frame.midX) == (superview.readableContentGuide.layoutFrame.midX)
                expect(view.frame.midY) == (superview.readableContentGuide.layoutFrame.midY)
                expect(view.frame.width) == 200
                expect(view.frame.height) == 200
            }
        }
    }
}

@available(iOS, introduced: 11.0)
@available(tvOS, introduced: 11.0)
final class SafeAreaLayoutGuideSpec: QuickSpec {
    override func spec() {
        describe("Safe area layout guide") {
            var superview: UIView!
            var view: UIView!

            beforeEach {
                superview = TestView(frame: UIScreen.main.bounds)
                view = TestView(frame: CGRect.zero)

                superview.addSubview(view)
            }

            it("Views should align to safe area edges") {
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
