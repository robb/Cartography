import Cartography

import Nimble
import Quick

class NumberSpec: QuickSpec {
    override func spec() {
        var superview: View!
        var view: View!

        beforeEach {
            superview = TestView(frame: CGRectMake(0, 0, 400, 400))

            view = TestView(frame: CGRectZero)
            superview.addSubview(view)
        }

        it("should compile with Floats") {
            let width: Float = 200
            let height: Float = 300

            layout(view) { view in
                view.width == width
                view.height == height
            }

            expect(view.frame.width).to(equal(200))
            expect(view.frame.height).to(equal(300))
        }

        it("should compile with Doubles") {
            let width: Double = 200
            let height: Double = 300

            layout(view) { view in
                view.width == width
                view.height == height
            }

            expect(view.frame.width).to(equal(200))
            expect(view.frame.height).to(equal(300))
        }

        it("should compile with CGFloats") {
            let width: CGFloat = 200
            let height: CGFloat = 300

            layout(view) { view in
                view.width == width
                view.height == height
            }

            expect(view.frame.width).to(equal(200))
            expect(view.frame.height).to(equal(300))
        }
    }
}
