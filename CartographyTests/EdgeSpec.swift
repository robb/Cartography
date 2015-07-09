import Cartography

import Nimble
import Quick

class EdgeSpec: QuickSpec {
    override func spec() {
        var superview: TestView!
        var view: TestView!

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
                constrain(view) { view in
                    view.top == view.superview!.top
                }

                expect(view.frame.minY).to(equal(0))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.top <= view.superview!.top
                    view.top >= view.superview!.top
                }

                expect(view.frame.minY).to(equal(0))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.top == view.superview!.top + 100
                }

                superview.layoutIfNeeded()

                expect(view.frame.minY).to(equal(100))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.top == view.superview!.top - 100
                }

                superview.layoutIfNeeded()

                expect(view.frame.minY).to(equal(-100))
            }
        }

        describe("LayoutProxy.right") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.right == view.superview!.right
                }

                superview.layoutIfNeeded()

                expect(view.frame.maxX).to(equal(400))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.right <= view.superview!.right
                    view.right >= view.superview!.right
                }

                superview.layoutIfNeeded()

                expect(view.frame.maxX).to(equal(400))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.right == view.superview!.right + 100
                }

                superview.layoutIfNeeded()

                expect(view.frame.maxX).to(equal(500))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.right == view.superview!.right - 100
                }

                superview.layoutIfNeeded()

                expect(view.frame.maxX).to(equal(300))
            }
        }

        describe("LayoutProxy.bottom") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.bottom == view.superview!.bottom
                }

                superview.layoutIfNeeded()

                expect(view.frame.maxY).to(equal(400))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.bottom <= view.superview!.bottom
                    view.bottom >= view.superview!.bottom
                }

                superview.layoutIfNeeded()

                expect(view.frame.maxY).to(equal(400))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.bottom == view.superview!.bottom + 100
                }

                superview.layoutIfNeeded()

                expect(view.frame.maxY).to(equal(500))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.bottom == view.superview!.bottom - 100
                }

                superview.layoutIfNeeded()

                expect(view.frame.maxY).to(equal(300))
            }
        }

        describe("LayoutProxy.left") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.left == view.superview!.left
                }

                expect(view.frame.minX).to(equal(0))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.left <= view.superview!.left
                    view.left >= view.superview!.left
                }

                expect(view.frame.minX).to(equal(0))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.left == view.superview!.left + 100
                }

                superview.layoutIfNeeded()

                expect(view.frame.minX).to(equal(100))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.left == view.superview!.left - 100
                }

                superview.layoutIfNeeded()

                expect(view.frame.minX).to(equal(-100))
            }
        }

        describe("LayoutProxy.centerX") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX
                }

                superview.layoutIfNeeded()

                expect(view.frame.midX).to(equal(200))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.centerX <= view.superview!.centerX
                    view.centerX >= view.superview!.centerX
                }

                superview.layoutIfNeeded()

                expect(view.frame.midX).to(equal(200))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX + 100
                }

                superview.layoutIfNeeded()

                expect(view.frame.midX).to(equal(300))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX - 100
                }

                superview.layoutIfNeeded()

                expect(view.frame.midX).to(equal(100))
            }

            it("should support multiplication") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX * 2
                }

                superview.layoutIfNeeded()

                expect(view.frame.midX).to(equal(400))
            }

            it("should support division") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX / 2
                }

                superview.layoutIfNeeded()

                expect(view.frame.midX).to(equal(100))
            }
        }

        describe("LayoutProxy.centerX") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX
                }

                expect(view.frame.midY).to(equal(200))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.centerX <= view.superview!.centerX
                    view.centerX >= view.superview!.centerX
                }

                expect(view.frame.midY).to(equal(200))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX + 100
                }

                expect(view.frame.midY).to(equal(300))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX - 100
                }

                expect(view.frame.midY).to(equal(100))
            }

            it("should support multiplication") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX * 2
                }

                expect(view.frame.midY).to(equal(400))
            }

            it("should support division") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX / 2
                }

                expect(view.frame.midY).to(equal(100))
            }
        }

#if os(iOS)
        describe("on iOS only") {
            beforeEach {
                superview.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
            }

            describe("LayoutProxy.topMargin") {
                it("should support relative equalities") {
                    constrain(view) { view in
                        view.top == view.superview!.topMargin
                    }

                    superview.layoutIfNeeded()

                    expect(view.frame.minY).to(equal(10))
                }
            }

            describe("LayoutProxy.rightMargin") {
                it("should support relative equalities") {
                    constrain(view) { view in
                        view.right == view.superview!.rightMargin
                    }

                    superview.layoutIfNeeded()

                    expect(view.frame.maxX).to(equal(360))
                }
            }

            describe("LayoutProxy.bottomMargin") {
                it("should support relative equalities") {
                    constrain(view) { view in
                        view.bottom == view.superview!.bottomMargin
                    }

                    superview.layoutIfNeeded()

                    expect(view.frame.maxY).to(equal(370))
                }
            }

            describe("LayoutProxy.leftMargin") {
                it("should support relative equalities") {
                    constrain(view) { view in
                        view.left == view.superview!.leftMargin
                    }

                    superview.layoutIfNeeded()

                    expect(view.frame.minX).to(equal(20))
                }
            }
        }
#endif
    }
}
