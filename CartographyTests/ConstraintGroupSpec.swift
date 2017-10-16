import Cartography

import Nimble
import Quick

class ConstraintGroupSpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var view1: TestView!

        beforeEach {
            window = TestWindow(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

            view1 = TestView(frame: CGRect.zero)
            window.addSubview(view1)
        }

        describe("Activating a group") {
            var a: ConstraintGroup!
            var b: ConstraintGroup!

            beforeEach {
                a = constrain(view1) { view in
                    view.width  == 100
                    view.height == 100
                }

                a.active = false

                b = constrain(view1) { view in
                    view.width  == 200
                    view.height == 200
                }

                b.active = false
            }

            it("should update the view") {
                a.active = true

                view1.layoutIfNeeded()

                expect(view1.frame.width).to(equal(100))
                expect(view1.frame.height).to(equal(100))

                a.active = false
                b.active = true

                window.layoutIfNeeded()

                expect(view1.frame.width).to(equal(200))
                expect(view1.frame.height).to(equal(200))
            }
        }

        describe("Replacing constraints") {
            var view2: TestView!

            beforeEach {
                view2 = TestView(frame: CGRect.zero)
                window.addSubview(view2)

                constrain(view1, view2) { view1, view2 in
                    view1.top    == view1.superview!.top   + 10
                    view1.left   == view1.superview!.left  + 10
                    view1.right  == view1.superview!.right - 10
                    view1.height == 200

                    view2.centerX == view1.centerX
                    view2.top     == view1.bottom
                    view2.width   == view1.width
                }

                window.layoutIfNeeded()
            }

            it("should update the view") {
                let group = constrain(view2) { view2 in
                    view2.height == 100
                }

                window.layoutIfNeeded()

                expect(view2.frame.height).to(equal(100))

                constrain(view2, replace: group) { view2 in
                    view2.bottom >= view2.superview!.bottom
                }

                window.layoutIfNeeded()

                expect(view2.frame.height).to(equal(190))
            }
        }
    }
}
