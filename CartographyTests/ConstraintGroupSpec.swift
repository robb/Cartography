import Cartography

import Nimble
import Quick

class ConstraintGroupSpec: QuickSpec {
    override func spec() {
        var superview: View!
        var view: View!

        beforeEach {
            superview = TestView(frame: CGRectMake(0, 0, 400, 400))

            view = TestView(frame: CGRectZero)
            superview.addSubview(view)
        }

        describe("Activating a group") {
            var a: ConstraintGroup!
            var b: ConstraintGroup!

            beforeEach {
                a = constrain(view) { view in
                    view.width  == 100
                    view.height == 100
                }

                a.active = false

                b = constrain(view) { view in
                    view.width  == 200
                    view.height == 200
                }

                b.active = false
            }

            it("should update the view") {
                a.active = true

                expect(view.frame.width).to(equal(100))
                expect(view.frame.height).to(equal(100))

                a.active = false
                b.active = true

                expect(view.frame.width).to(equal(200))
                expect(view.frame.height).to(equal(200))
            }
        }
    }
}
