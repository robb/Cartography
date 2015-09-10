import Cartography

import Nimble
import Quick

class MemoryLeakSpec: QuickSpec {
    override func spec() {
        describe("constrain") {
            it("should not leak memory") {
                weak var weak_superview: View? = .None
                weak var weak_viewA: View? = .None
                weak var weak_viewB: View? = .None

                autoreleasepool {
                    let superview = View(frame: CGRectMake(0, 0, 400, 400))

                    let viewA: TestView = TestView(frame: CGRectMake(0, 0, 200, 200))
                    superview.addSubview(viewA)

                    let viewB: TestView = TestView(frame: CGRectMake(0, 0, 200, 200))
                    superview.addSubview(viewB)

                    weak_superview = superview
                    weak_viewA = viewA
                    weak_viewB = viewB

                    constrain(viewA, viewB) { viewA, viewB in
                        viewA.top    == viewB.top
                        viewB.bottom == viewA.bottom
                    }
                }

                expect(weak_superview).to(beNil())
                expect(weak_viewA).to(beNil())
                expect(weak_viewB).to(beNil())
            }
        }
    }
}
