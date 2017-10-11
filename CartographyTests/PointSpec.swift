import Cartography

import Nimble
import Quick

class PointSpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var view: TestView!

        beforeEach {
            window = TestWindow(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

            view = TestView(frame: CGRect.zero)
            window.addSubview(view)

            constrain(elements: view) { view in
                view.width  == 200
                view.height == 200
            }
        }

        describe("LayoutProxy.center") {
            it("should support relative equalities") {
                constrain(elements: view) { view in
                    view.center == view.superview!.center
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(CGRect(x: 100, y: 100, width: 200, height: 200)))
            }

            it("should support relative inequalities") {
                constrain(elements: view) { view in
                    view.center <= view.superview!.center
                    view.center >= view.superview!.center
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(CGRect(x: 100, y: 100, width: 200, height: 200)))
            }
        }

#if os(iOS) || os(tvOS)
        describe("on iOS only") {
            beforeEach {
                view.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
            }

            describe("LayoutProxy.centerWithinMargins") {
                it("should support relative equalities") {
                    constrain(elements: view) { view in
                        view.centerWithinMargins == view.superview!.center
                    }

                    window.layoutIfNeeded()

                    expect(view.frame).to(equal(CGRect(x: 110, y: 110, width: 200, height: 200)))
                }

                it("should support relative inequalities") {
                    constrain(elements: view) { view in
                        view.centerWithinMargins <= view.superview!.center
                        view.centerWithinMargins >= view.superview!.center
                    }

                    window.layoutIfNeeded()

                    expect(view.frame).to(equal(CGRect(x: 110, y: 110, width: 200, height: 200)))
                }
            }
        }
#endif
    }
}
