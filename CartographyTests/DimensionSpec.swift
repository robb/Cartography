import Cartography

import Nimble
import Quick

class DimensionSpec: QuickSpec {
    override func spec() {
        var superview: View!
        var view: View!

        beforeEach {
            superview = TestView(frame: CGRectMake(0, 0, 400, 400))

            view = TestView(frame: CGRectZero)
            superview.addSubview(view)
        }

        describe("LayoutProxy.width") {
            it("should support relative equalities") {
                layout(view) { view in
                    view.width == view.superview!.width - 200
                }

                expect(view.frame.width).to(equal(200))
            }

            it("should support numerical equalities") {
                layout(view) { view in
                    view.width == 200
                }

                expect(view.frame.width).to(equal(200))
            }
        }

        describe("LayoutProxy.height") {
            it("should support relative equalities") {
                layout(view) { view in
                    view.height == view.superview!.height - 200
                }

                expect(view.frame.height).to(equal(200))
            }

            it("should support numerical equalities") {
                layout(view) { view in
                    view.height == 200
                }

                expect(view.frame.height).to(equal(200))
            }
        }
    }
}
