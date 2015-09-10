import Cartography

import Nimble
import Quick

class PointSpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var view: TestView!

        beforeEach {
            window = TestWindow(frame: CGRectMake(0, 0, 400, 400))

            view = TestView(frame: CGRectZero)
            window.addSubview(view)

            constrain(view) { view in
                view.width  == 200
                view.height == 200
            }
        }

        describe("LayoutProxy.center") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.center == view.superview!.center
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(CGRectMake(100, 100, 200, 200)))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.center <= view.superview!.center
                    view.center >= view.superview!.center
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(CGRectMake(100, 100, 200, 200)))
            }
        }

#if os(iOS)
        describe("on iOS only") {
            beforeEach {
                view.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
            }

            describe("LayoutProxy.centerWithinMargins") {
                it("should support relative equalities") {
                    constrain(view) { view in
                        view.centerWithinMargins == view.superview!.center
                    }

                    window.layoutIfNeeded()

                    expect(view.frame).to(equal(CGRectMake(110, 110, 200, 200)))
                }

                it("should support relative inequalities") {
                    constrain(view) { view in
                        view.centerWithinMargins <= view.superview!.center
                        view.centerWithinMargins >= view.superview!.center
                    }

                    window.layoutIfNeeded()

                    expect(view.frame).to(equal(CGRectMake(110, 110, 200, 200)))
                }
            }
        }
#endif
    }
}
