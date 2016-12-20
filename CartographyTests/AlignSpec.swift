import Cartography

import Nimble
import Quick

class AlignSpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var viewA: TestView!
        var viewB: TestView!
        var viewC: TestView!

        beforeEach {
            window = TestWindow(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

            viewA = TestView(frame: CGRect.zero)
            window.addSubview(viewA)

            viewB = TestView(frame: CGRect.zero)
            window.addSubview(viewB)

            viewC = TestView(frame: CGRect.zero)
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
                constrain(viewA, viewB, viewC) { viewA, viewB, viewC in
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
                expect(viewA).notTo(translateAutoresizingMasksToConstraints())
                expect(viewB).notTo(translateAutoresizingMasksToConstraints())
                expect(viewC).notTo(translateAutoresizingMasksToConstraints())
            }
        }

        describe("for horizontal and vertical centers") {
            beforeEach {
                constrain(viewA, viewB, viewC) { viewA, viewB, viewC in
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
                expect(viewA).notTo(translateAutoresizingMasksToConstraints())
                expect(viewB).notTo(translateAutoresizingMasksToConstraints())
                expect(viewC).notTo(translateAutoresizingMasksToConstraints())
            }
        }
        
        describe("no constraints") {
            it("should have no constraints for a single view alignment") {
                constrain(viewA) { viewA in
                    let constraints = align(top: [viewA])
                    
                    expect(constraints.count).to(equal(0))
                }
            }
            
            it("should have no constraints for no view") {
                let constraints = align(top: [])
                expect(constraints.count).to(equal(0))
            }
        }
    }
}
