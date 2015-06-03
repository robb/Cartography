import Cartography

import Nimble
import Quick

class DistributeSpec: QuickSpec {
    override func spec() {
        var superview: View!
        var viewA: View!
        var viewB: View!
        var viewC: View!

        beforeEach {
            superview = TestView(frame: CGRectMake(0, 0, 400, 400))

            viewA = TestView(frame: CGRectZero)
            superview.addSubview(viewA)

            viewB = TestView(frame: CGRectZero)
            superview.addSubview(viewB)

            viewC = TestView(frame: CGRectZero)
            superview.addSubview(viewC)

            constrain(viewA, viewB, viewC) { viewA, viewB, viewC in
                viewA.width  == 100
                viewA.height == 100

                viewA.top  == viewA.superview!.top
                viewA.left == viewA.superview!.left

                viewA.size == viewB.size
                viewA.size == viewC.size
            }
        }

        describe("from left to right") {
            beforeEach {
                layout(viewA, viewB, viewC) { viewA, viewB, viewC in
                    align(centerY: viewA, viewB, viewC)
                    distribute(by: 10, leftToRight: viewA, viewB, viewC)
                }
            }

            it("should distribute the views") {
                expect(viewA.frame.minX).to(equal(  0))
                expect(viewB.frame.minX).to(equal(110))
                expect(viewC.frame.minX).to(equal(220))
            }

            it("should disable translating autoresizing masks into constraints") {
                expect(viewA.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                expect(viewB.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                expect(viewC.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
            }
        }

        describe("vertically") {
            beforeEach {
                layout(viewA, viewB, viewC) { viewA, viewB, viewC in
                    align(centerX: viewA, viewB, viewC)
                    distribute(by: 10, vertically: viewA, viewB, viewC)
                }
            }

            it("should distribute the views") {
                expect(viewA.frame.minY).to(equal(  0))
                expect(viewB.frame.minY).to(equal(110))
                expect(viewC.frame.minY).to(equal(220))
            }

            it("should disable translating autoresizing masks into constraints") {
                expect(viewA.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                expect(viewB.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                expect(viewC.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
            }
        }
        
        describe("horizontally with array of views") {
            beforeEach {
                layout([viewA, viewB, viewC]) { views in
                    align(centerY: views[0], views[1], views[2])
                    distribute(by: 10, leftToRight: views)
                }
                
                it("should distribute the views") {
                    expect(viewA.frame.minX).to(equal(  0))
                    expect(viewB.frame.minX).to(equal(110))
                    expect(viewC.frame.minX).to(equal(220))
                }
                
                it("should disable translating autoresizing masks into constraints") {
                    expect(viewA.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                    expect(viewB.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                    expect(viewC.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                }
            }
        }
        
        describe("vertically with array of views") {
            beforeEach {
                layout([viewA, viewB, viewC]) { views in
                    align(centerY: views[0], views[1], views[2])
                    distribute(by: 10, leftToRight: views)
                }
                
                it("should distribute the views") {
                    expect(viewA.frame.minY).to(equal(  0))
                    expect(viewB.frame.minY).to(equal(110))
                    expect(viewC.frame.minY).to(equal(220))
                }
                
                it("should disable translating autoresizing masks into constraints") {
                    expect(viewA.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                    expect(viewB.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                    expect(viewC.car_translatesAutoresizingMaskIntoConstraints).to(beFalse())
                }
            }
        }
    }
}
