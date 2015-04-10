import Cartography

import Nimble
import Quick

class EdgesSpec: QuickSpec {
    override func spec() {
        var superview: View!
        var view: View!

        beforeEach {
            superview = TestView(frame: CGRectMake(0, 0, 400, 400))

            view = TestView(frame: CGRectZero)
            superview.addSubview(view)
        }

        describe("LayoutProxy.edges") {
            it("should support relative equalities") {
                layout(view) { view in
                    view.edges == view.superview!.edges
                }

                expect(view.frame).to(equal(view.superview?.frame))
            }
        }

        describe("LayoutProxy.edges") {
            it("should support relative inequalities") {
                layout(view) { view in
                    view.edges <= view.superview!.edges
                    view.edges >= view.superview!.edges
                }

                expect(view.frame).to(equal(view.superview?.frame))
            }
        }

        describe("inset") {
            it("should inset all edges with the same amount") {
                layout(view) { view in
                    view.edges == inset(view.superview!.edges, 20)
                }

                expect(view.frame).to(equal(CGRectMake(20, 20, 360, 360)))
            }

            it("should inset the horizontal and vertical edge individually") {
                layout(view) { view in
                    view.edges == inset(view.superview!.edges, 20, 30)
                }

                expect(view.frame).to(equal(CGRectMake(20, 30, 360, 340)))
            }

            it("should inset all edges individually") {
                layout(view) { view in
                    view.edges == inset(view.superview!.edges, 10, 20, 30, 40)
                }

                expect(view.frame).to(equal(CGRectMake(20, 10, 340, 360)))
            }
        }
    }
}
