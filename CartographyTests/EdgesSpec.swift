import Cartography

import Nimble
import Quick

class EdgesSpec: QuickSpec {
    override func spec() {
        var superview: TestView!
        var view: TestView!

        beforeEach {
            superview = TestView(frame: CGRectMake(0, 0, 400, 400))

            view = TestView(frame: CGRectZero)
            superview.addSubview(view)
        }

        describe("LayoutProxy.edges") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.edges == view.superview!.edges
                }

                superview.layoutIfNeeded()

                expect(view.frame).to(equal(view.superview?.frame))
            }
        }

        describe("LayoutProxy.edges") {
            it("should support relative inequalities") {
                constrain(view) { view in
                    view.edges <= view.superview!.edges
                    view.edges >= view.superview!.edges
                }

                superview.layoutIfNeeded()

                expect(view.frame).to(equal(view.superview?.frame))
            }
        }

        describe("inset") {
            it("should inset all edges with the same amount") {
                constrain(view) { view in
                    view.edges == inset(view.superview!.edges, 20)
                }

                superview.layoutIfNeeded()

                expect(view.frame).to(equal(CGRectMake(20, 20, 360, 360)))
            }

            it("should inset the horizontal and vertical edge individually") {
                constrain(view) { view in
                    view.edges == inset(view.superview!.edges, 20, 30)
                }

                superview.layoutIfNeeded()

                expect(view.frame).to(equal(CGRectMake(20, 30, 360, 340)))
            }

            it("should inset all edges individually") {
                constrain(view) { view in
                    view.edges == inset(view.superview!.edges, 10, 20, 30, 40)
                }

                superview.layoutIfNeeded()

                expect(view.frame).to(equal(CGRectMake(20, 10, 340, 360)))
            }
        }

#if os(iOS)
        describe("on iOS only") {
            beforeEach {
                superview.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
            }

            describe("LayoutProxy.edgesWithinMargins") {
                it("should support relative equalities") {
                    constrain(view) { view in
                        view.edges == view.superview!.edgesWithinMargins
                    }

                    superview.layoutIfNeeded()

                   expect(view.frame).to(equal(CGRectMake(20, 10, 340, 360)))
                }
            }
        }
#endif
    }
}
