import Cartography

import Nimble
import Quick

class EdgeSpec: QuickSpec {
    override func spec() {
        var superview: View!
        var view: View!

        beforeEach {
            superview = TestView(frame: CGRectMake(0, 0, 400, 400))

            view = TestView(frame: CGRectZero)
            superview.addSubview(view)

            constrain(view) { view in
                view.height == 200
                view.width == 200
            }
        }

        describe("LayoutProxy.top") {
            it("should support relative equalities") {
                layout(view) { view in
                    view.top == view.superview!.top + 100
                }

                expect(view.frame.minY).to(equal(100))
            }
        }

        describe("LayoutProxy.right") {
            it("should support relative equalities") {
                layout(view) { view in
                    view.right == view.superview!.right - 100
                }

                expect(view.frame.maxX).to(equal(300))
            }
        }

        describe("LayoutProxy.bottom") {
            it("should support relative equalities") {
                layout(view) { view in
                    view.bottom == view.superview!.bottom - 100
                }

                expect(view.frame.maxY).to(equal(300))
            }
        }

        describe("LayoutProxy.left") {
            it("should support relative equalities") {
                layout(view) { view in
                    view.left == view.superview!.left + 100
                }

                expect(view.frame.minX).to(equal(100))
            }
        }

        describe("LayoutProxy.centerX") {
            it("should support relative equalities") {
                layout(view) { view in
                    view.centerX == view.superview!.centerX
                }

                expect(view.frame.midX).to(equal(200))
            }
        }

        describe("LayoutProxy.centerY") {
            it("should support relative equalities") {
                layout(view) { view in
                    view.centerY == view.superview!.centerY
                }

                expect(view.frame.midY).to(equal(200))
            }
        }

#if os(iOS)
        describe("on iOS only") {
            beforeEach {
                view.layoutMargins = UIEdgeInsets(top: -10, left: -20, bottom: -30, right: -40)
            }

            describe("LayoutProxy.topMargin") {
                it("should support relative equalities") {
                    layout(view) { view in
                        view.topMargin == view.superview!.top
                    }

                    expect(view.frame.minY).to(equal(10))
                }
            }

            describe("LayoutProxy.rightMargin") {
                it("should support relative equalities") {
                    layout(view) { view in
                        view.rightMargin == view.superview!.right
                    }

                    expect(view.frame.maxX).to(equal(360))
                }
            }

            describe("LayoutProxy.bottomMargin") {
                it("should support relative equalities") {
                    layout(view) { view in
                        view.bottomMargin == view.superview!.bottom
                    }

                    expect(view.frame.maxY).to(equal(370))
                }
            }

            describe("LayoutProxy.leftMargin") {
                it("should support relative equalities") {
                    layout(view) { view in
                        view.leftMargin == view.superview!.left
                    }

                    expect(view.frame.minX).to(equal(20))
                }
            }
        }
#endif
    }
}
