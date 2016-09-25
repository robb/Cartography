import Cartography

import Nimble
import Quick

class MemoryLeakSpec: QuickSpec {
    override func spec() {
        describe("constrain") {
            it("should not leak memory") {
                weak var weak_superview: View? = .none
                weak var weak_viewA: View? = .none
                weak var weak_viewB: View? = .none

                autoreleasepool {
                    let superview = View(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

                    let viewA: TestView = TestView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
                    superview.addSubview(viewA)

                    let viewB: TestView = TestView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
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
