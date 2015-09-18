import Cartography

import Nimble
import Quick

class EdgesSpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var view: TestView!

        beforeEach {
            window = TestWindow(frame: CGRectMake(0, 0, 400, 400))

            view = TestView(frame: CGRectZero)
            window.addSubview(view)
        }

        describe("LayoutProxy.edges") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.edges == view.superview!.edges
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(view.superview?.frame))
            }
        }

        describe("LayoutProxy.edges") {
            it("should support relative inequalities") {
                constrain(view) { view in
                    view.edges <= view.superview!.edges
                    view.edges >= view.superview!.edges
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(view.superview?.frame))
            }
        }

        describe("inset") {
            it("should inset all edges with the same amount") {
                constrain(view) { view in
                    view.edges == inset(view.superview!.edges, 20)
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(CGRectMake(20, 20, 360, 360)))
            }

            it("should inset the horizontal and vertical edge individually") {
                constrain(view) { view in
                    view.edges == inset(view.superview!.edges, 20, 30)
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(CGRectMake(20, 30, 360, 340)))
            }

            it("should inset all edges individually") {
                constrain(view) { view in
                    view.edges == inset(view.superview!.edges, 10, 20, 30, 40)
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(CGRectMake(20, 10, 340, 360)))
            }
        }

#if os(iOS)
        describe("on iOS only") {
            beforeEach {
                window.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
            }

            describe("LayoutProxy.edgesWithinMargins") {
                it("should support relative equalities") {
                    constrain(view) { view in
                        view.edges == view.superview!.edgesWithinMargins
                    }

                    window.layoutIfNeeded()

                   expect(view.frame).to(equal(CGRectMake(20, 10, 340, 360)))
                }
            }
        }
#endif
    }
}
