import Cartography

import Nimble
import Quick

class SizeSpec: QuickSpec {
    override func spec() {
        var superview: View!
        var view: View!

        beforeEach {
            superview = TestView(frame: CGRectMake(0, 0, 400, 400))

            view = TestView(frame: CGRectZero)
            superview.addSubview(view)
        }

        describe("LayoutProxy.size") {
            it("should support relative equalities") {
                layout(view) { view in
                    view.size == view.superview!.size
                }

                expect(view.frame.size).to(equal(CGSizeMake(400, 400)))
            }

            it("should support relative inequalities") {
                layout(view) { view in
                    view.size <= view.superview!.size
                    view.size >= view.superview!.size
                }

                expect(view.frame.size).to(equal(CGSizeMake(400, 400)))
            }

            it("should support multiplication") {
                layout(view) { view in
                    view.size == view.superview!.size * 2
                }

                expect(view.frame.size).to(equal(CGSizeMake(800, 800)))
            }

            it("should support division") {
                layout(view) { view in
                    view.size == view.superview!.size / 2
                }

                expect(view.frame.size).to(equal(CGSizeMake(200, 200)))
            }
        }
    }
}
