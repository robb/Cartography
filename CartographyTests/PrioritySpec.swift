import Cartography

import Nimble
import Quick

class PrioritySpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var view: TestView!

        beforeEach {
            window = TestWindow(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

            view = TestView(frame: CGRect.zero)
            window.addSubview(view)
        }

        it("should operate on a single constraint") {
            var constraint: NSLayoutConstraint!

            constrain(elements: view) { view in
                constraint = view.width == 200 ~ LayoutPriority(100)
            }

            expect(constraint.priority).to(equal(LayoutPriority(100)))
        }

        it("should operate on an array of constraints") {
            var constraints: [NSLayoutConstraint]!

            constrain(elements: view) { view in
                constraints = (view.size <= view.superview!.size ~ LayoutPriority(100))
            }

            expect(constraints[0].priority).to(equal(LayoutPriority(100)))
            expect(constraints[1].priority).to(equal(LayoutPriority(100)))
        }
    }
}
