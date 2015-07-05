import Cartography

import Nimble
import Quick

class AlignSpec: QuickSpec {
    override func spec() {
        var window: View!
        var viewA: View!
        var viewB: View!
        var viewC: View!

        beforeEach {
            window = TestWindow(frame: CGRectMake(0, 0, 400, 400))

            viewA = TestView(frame: CGRectZero)
            window.addSubview(viewA)

            viewB = TestView(frame: CGRectZero)
            window.addSubview(viewB)

            viewC = TestView(frame: CGRectZero)
            window.addSubview(viewC)

            constrain(viewA) { view in
                view.height == 200
                view.width == 200

                view.top  == view.superview!.top  + 10
                view.left == view.superview!.left + 10
            }
        }

        describe("for edges") {
            beforeEach {
                layout(viewA, viewB, viewC) { viewA, viewB, viewC in
                    align(top: viewA, viewB, viewC)
                    align(right: viewA, viewB, viewC)
                    align(bottom: viewA, viewB, viewC)
                    align(left: viewA, viewB, viewC)
                }
            }

            it("should align edges") {
                expect(viewA.frame).to(equal(viewB.frame))
                expect(viewA.frame).to(equal(viewB.frame))
            }

            it("should disable translating autoresizing masks into constraints") {
                expect(viewA.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                expect(viewB.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                expect(viewC.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
            }
        }

        describe("for horizontal and vertical centers") {
            beforeEach {
                layout(viewA, viewB, viewC) { viewA, viewB, viewC in
                    viewA.size == viewB.size
                    viewB.size == viewC.size

                    align(centerX: viewA, viewB, viewC)
                    align(centerY: viewA, viewB, viewC)
                }
            }

            it("should align center points") {
                expect(viewA.frame).to(equal(viewB.frame))
                expect(viewA.frame).to(equal(viewB.frame))
            }

            it("should disable translating autoresizing masks into constraints") {
                expect(viewA.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                expect(viewB.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                expect(viewC.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
            }
        }
    }
}
