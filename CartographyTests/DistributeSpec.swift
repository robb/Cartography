import Cartography

import Nimble
import Quick

class DistributeSpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var viewA: TestView!
        var viewB: TestView!
        var viewC: TestView!

        let constraintsGroup = ConstraintGroup()

        beforeEach {
            window = TestWindow(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

            viewA = TestView(frame: CGRect.zero)
            window.addSubview(viewA)

            viewB = TestView(frame: CGRect.zero)
            window.addSubview(viewB)

            viewC = TestView(frame: CGRect.zero)
            window.addSubview(viewC)

            constrain(viewA, viewB, viewC, replace: constraintsGroup) { viewA, viewB, viewC in
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
                constrain(viewA, viewB, viewC) { viewA, viewB, viewC in
                    align(centerY: viewA, viewB, viewC)
                    distribute(by: 10, leftToRight: viewA, viewB, viewC)
                }

                window.layoutIfNeeded()
            }

            it("should distribute the views") {
                expect(viewA.frame.minX).to(equal(  0))
                expect(viewB.frame.minX).to(equal(110))
                expect(viewC.frame.minX).to(equal(220))
            }

            it("should disable translating autoresizing masks into constraints") {
                expect(viewA).notTo(translateAutoresizingMasksToConstraints())
                expect(viewB).notTo(translateAutoresizingMasksToConstraints())
                expect(viewC).notTo(translateAutoresizingMasksToConstraints())
            }
        }

        describe("vertically") {
            beforeEach {
                constrain(viewA, viewB, viewC) { viewA, viewB, viewC in
                    align(centerX: viewA, viewB, viewC)
                    distribute(by: 10, vertically: viewA, viewB, viewC)
                }

                window.layoutIfNeeded()
            }

            it("should distribute the views") {
                expect(viewA.frame.minY).to(equal(  0))
                expect(viewB.frame.minY).to(equal(110))
                expect(viewC.frame.minY).to(equal(220))
            }

            it("should disable translating autoresizing masks into constraints") {
                expect(viewA).notTo(translateAutoresizingMasksToConstraints())
                expect(viewB).notTo(translateAutoresizingMasksToConstraints())
                expect(viewC).notTo(translateAutoresizingMasksToConstraints())
            }
        }
        
        describe("no constraints") {
            it("should have no constraints for a single view distribution") {
                constrain(viewA) { viewA in
                    let constraints = distribute(horizontally: [viewA])
                    
                    expect(constraints.count).to(equal(0))
                }
            }
            
            it("should have no constraints for no view") {
                let constraints = distribute(horizontally: [])
                expect(constraints.count).to(equal(0))
            }
        }

        describe("When distributing width") {
            beforeEach {
                constrain(viewA, viewB, viewC, replace: constraintsGroup) {
                    viewA, viewB, viewC in

                    viewA.width == 50

                    distribute(equalWidth: [viewA, viewB, viewC])
                }

                window.layoutIfNeeded()
            }

            it("should distribute the same width through all the views") {
                expect(viewA.frame.width).to(equal(50))
                expect(viewB.frame.width).to(equal(viewA.frame.width))
                expect(viewC.frame.width).to(equal(viewB.frame.width))
            }
        }

        describe("When distributing height") {
            beforeEach {
                constrain(viewA, viewB, viewC, replace: constraintsGroup) {
                    viewA, viewB, viewC in

                    viewA.height == 50

                    distribute(equalHeight: [viewA, viewB, viewC])
                }

                window.layoutIfNeeded()
            }

            it("should distribute the same height through all the views") {
                expect(viewA.frame.height).to(equal(50))
                expect(viewB.frame.height).to(equal(viewA.frame.height))
                expect(viewC.frame.height).to(equal(viewB.frame.height))
            }
        }
    }
}
