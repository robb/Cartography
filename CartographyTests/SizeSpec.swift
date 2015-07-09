import Cartography

import Nimble
import Quick

class SizeSpec: QuickSpec {
    override func spec() {
        var superview: TestView!
        var view: TestView!

        beforeEach {
            superview = TestView(frame: CGRectMake(0, 0, 400, 400))

            view = TestView(frame: CGRectZero)
            superview.addSubview(view)
        }

        describe("LayoutProxy.size") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.size == view.superview!.size
                }

                superview.layoutIfNeeded()

                expect(view.frame.size).to(equal(CGSizeMake(400, 400)))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.size <= view.superview!.size
                    view.size >= view.superview!.size
                }

                superview.layoutIfNeeded()

                expect(view.frame.size).to(equal(CGSizeMake(400, 400)))
            }

            it("should support multiplication") {
                constrain(view) { view in
                    view.size == view.superview!.size * 2
                }

                superview.layoutIfNeeded()

                expect(view.frame.size).to(equal(CGSizeMake(800, 800)))
            }

            it("should support division") {
                constrain(view) { view in
                    view.size == view.superview!.size / 2
                }

                superview.layoutIfNeeded()

                expect(view.frame.size).to(equal(CGSizeMake(200, 200)))
            }
        }
    }
}
