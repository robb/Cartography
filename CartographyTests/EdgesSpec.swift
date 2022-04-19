import Cartography

import Nimble
import Quick

class EdgesSpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var view: TestView!

        beforeEach {
            window = TestWindow(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

            view = TestView(frame: CGRect.zero)
            window.addSubview(view)
        }

        describe("LayoutProxy.edges") {
            it("should support relative equalities") {
                cg_constrain(view) { view in
                    view.edges == view.superview!.edges
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(view.superview?.frame))
            }
        }

        describe("LayoutProxy.edges") {
            it("should support relative inequalities") {
                cg_constrain(view) { view in
                    view.edges <= view.superview!.edges
                    view.edges >= view.superview!.edges
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(view.superview?.frame))
            }
        }

        describe("inset") {
            it("should inset all edges with the same amount") {
                cg_constrain(view) { view in
                    view.edges == inset(view.superview!.edges, 20)
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(CGRect(x: 20, y: 20, width: 360, height: 360)))
            }

            it("should inset the horizontal and vertical edge individually") {
                cg_constrain(view) { view in
                    view.edges == inset(view.superview!.edges, 20, 30)
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(CGRect(x: 20, y: 30, width: 360, height: 340)))
            }

            it("should inset the horizontal edges") {
                cg_constrain(view) { view in
                    view.edges == inset(view.superview!.edges, horizontally: 20)
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(CGRect(x: 20, y: 0, width: 360, height: 400)))
            }

            it("should inset the vertical edges") {
                cg_constrain(view) { view in
                    view.edges == inset(view.superview!.edges, vertically: 30)
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(CGRect(x: 0, y: 30, width: 400, height: 340)))
            }

            it("should inset all edges individually") {
                cg_constrain(view) { view in
                    view.edges == inset(view.superview!.edges, 10, 20, 30, 40)
                }

                window.layoutIfNeeded()

                expect(view.frame).to(equal(CGRect(x: 20, y: 10, width: 340, height: 360)))
            }
        }

        #if os(iOS) || os(tvOS)
        describe("on iOS only") {
            beforeEach {
                window.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
            }

            describe("LayoutProxy.edgesWithinMargins") {
                it("should support relative equalities") {
                    cg_constrain(view) { view in
                        view.edges == view.superview!.edgesWithinMargins
                    }

                    window.layoutIfNeeded()

                    expect(view.frame).to(equal(CGRect(x: 20, y: 10, width: 340, height: 360)))
                }
            }
        }
        #endif
    }
}
