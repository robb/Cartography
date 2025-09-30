//
//  ViewProxyTests.swift
//  Cartography-iOS-Tests
//
//  Created by Luís Portela on 01/10/2018.
//  Copyright © 2018 Robert Böhnke. All rights reserved.
//

import Nimble
import Quick
import UIKit

@testable import Cartography

@available(iOS, introduced: 9.0)
@available(tvOS, introduced: 9.0)
final class ViewProxyTestsSpec: QuickSpec {
    override func spec() {
        describe("ViewProxy SafeArea Layout Guide") {

            let view: UIView = UIView(frame: .zero)

            cg_constrain(view) { testingView in
                if #available(iOS 11, *), #available(tvOS 11, *) {
                    context("When running on iOS 11+ devices") {
                        it("safeArea should be SafeAreaLayoutGuide") {
                            expect(testingView.safeArea.item).to(beIdenticalTo(testingView.safeAreaLayoutGuide.item))
                        }
                    }
                } else {
                    context("When runnig prior versions of iOS 11") {
                        it("safeArea should be LayoutMarginsGuide") {
                            expect(testingView.safeArea.item).to(beIdenticalTo(testingView.layoutMarginsGuide.item))
                        }
                    }
                }
            }
        }
    }
}
