import Cartography

import Nimble
import Quick

class PrioritySpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var view: TestView!

        beforeEach {
            window = TestWindow(frame: CGRectMake(0, 0, 200, 200))

            view = TestView(frame: CGRectZero)
            window.addSubview(view)
        }

        it("should operate on a single constraint") {
            var constraint: NSLayoutConstraint!

            constrain(view) { view in
                constraint = (view.width == 200 ~ 100)
            }

            expect(constraint.priority).to(equal(100))
        }

        it("should operate on an array of constraints") {
            var constraints: [NSLayoutConstraint]!

            constrain(view) { view in
                constraints = (view.size <= view.superview!.size ~ 100)
            }

            expect(constraints[0].priority).to(equal(100))
            expect(constraints[1].priority).to(equal(100))
        }
    }
}
