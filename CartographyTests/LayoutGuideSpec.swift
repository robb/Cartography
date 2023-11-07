//
//  LayoutGuideSpec.swift
//  Cartography-iOS
//
//  Created by Vitor Travain on 16/10/17.
//  Copyright © 2017 Robert Böhnke. All rights reserved.
//

import Quick
import Nimble
@testable import Cartography

@available(iOS, introduced: 9.0)
@available(tvOS, introduced: 9.0)
@available(OSX, introduced: 10.11)
final class LayoutGuideSpec: QuickSpec {
    override func spec() {
        var view: View!
        var layoutGuide: LayoutGuide!

        beforeEach {
            view = View(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
            #if os(OSX)
                view.autoresizingMask = .none
            #endif
            layoutGuide = LayoutGuide()

            view.addLayoutGuide(layoutGuide)
        }

        describe("LayoutGuideProxy") {
            it("should support relative equalities") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.edges == layoutGuide.owningView!.edges
                }

                #if os(iOS) || os(tvOS) || os(visionOS)
                    view.layoutIfNeeded()

                    expect(layoutGuide.layoutFrame.origin.x) == 0
                    expect(layoutGuide.layoutFrame.origin.y) == 0
                    expect(layoutGuide.layoutFrame.width) == 400
                    expect(layoutGuide.layoutFrame.height) == 400
                #elseif os(OSX)
                    view.needsLayout = true
                    view.layoutSubtreeIfNeeded()

                    expect(layoutGuide.frame.origin.x) == 0
                    expect(layoutGuide.frame.origin.y) == 0
                    expect(layoutGuide.frame.width) == 400
                    expect(layoutGuide.frame.height) == 400
                #endif
            }

            it("should support inequalities") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.top >= layoutGuide.owningView!.top
                    layoutGuide.bottom <= layoutGuide.owningView!.bottom

                    layoutGuide.left >= layoutGuide.owningView!.left
                    layoutGuide.right <= layoutGuide.owningView!.right

                    layoutGuide.center == layoutGuide.owningView!.center ~ .defaultLow

                    layoutGuide.width == 200
                    layoutGuide.height == 200
                }

                #if os(iOS) || os(tvOS) || os(visionOS)
                    view.layoutIfNeeded()

                    expect(layoutGuide.layoutFrame.midX) == 200
                    expect(layoutGuide.layoutFrame.midY) == 200
                    expect(layoutGuide.layoutFrame.width) == 200
                    expect(layoutGuide.layoutFrame.height) == 200
                #elseif os(OSX)
                    view.needsLayout = true
                    view.layoutSubtreeIfNeeded()

                    expect(layoutGuide.frame.midX) == 200
                    expect(layoutGuide.frame.midY) == 200
                    expect(layoutGuide.frame.width) == 200
                    expect(layoutGuide.frame.height) == 200
                #endif
            }

            it("should support addition") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.leading == layoutGuide.owningView!.leading + 10
                }

                #if os(iOS) || os(tvOS) || os(visionOS)
                    view.layoutIfNeeded()

                    expect(layoutGuide.layoutFrame.minX) == 10
                #elseif os(OSX)
                    view.needsLayout = true
                    view.layoutSubtreeIfNeeded()

                    expect(layoutGuide.frame.minX) == 10
                #endif
            }

            it("should support subtraction") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.trailing == layoutGuide.owningView!.trailing - 10
                }

                #if os(iOS) || os(tvOS) || os(visionOS)
                    view.layoutIfNeeded()

                    expect(layoutGuide.layoutFrame.maxX) == 390
                #elseif os(OSX)
                    view.needsLayout = true
                    view.layoutSubtreeIfNeeded()

                    expect(layoutGuide.frame.maxX) == 390
                #endif
            }

            it("should support multiplication") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.width == 0.5 * layoutGuide.owningView!.width
                }

                #if os(iOS) || os(tvOS) || os(visionOS)
                    view.layoutIfNeeded()

                    expect(layoutGuide.layoutFrame.width) == 0.5 * view.frame.width
                #elseif os(OSX)
                    view.needsLayout = true
                    view.layoutSubtreeIfNeeded()

                    expect(layoutGuide.frame.width) == 0.5 * view.frame.width
                #endif
            }

            it("should support division") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.width == layoutGuide.owningView!.width / 2
                }

                #if os(iOS) || os(tvOS) || os(visionOS)
                    view.layoutIfNeeded()

                    expect(layoutGuide.layoutFrame.width) == view.frame.width / 2
                #elseif os(OSX)
                    view.needsLayout = true
                    view.layoutSubtreeIfNeeded()

                    expect(layoutGuide.frame.width) == view.frame.width / 2
                #endif
            }

            it("should support centering") {
                constrain(layoutGuide) { layoutGuide in
                    layoutGuide.center == layoutGuide.owningView!.center
                }

                #if os(iOS) || os(tvOS) || os(visionOS)
                    view.layoutIfNeeded()

                    expect(layoutGuide.layoutFrame.midX) == 200
                    expect(layoutGuide.layoutFrame.midY) == 200
                #elseif os(OSX)
                    view.needsLayout = true
                    view.layoutSubtreeIfNeeded()

                    expect(layoutGuide.frame.midX) == 200
                    expect(layoutGuide.frame.midY) == 200
                #endif
            }
        }
    }
}
