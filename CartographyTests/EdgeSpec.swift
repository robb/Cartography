import Cartography

import Nimble
import Quick

class EdgeSpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var view: TestView!

        beforeEach {
            window = TestWindow(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

            view = TestView(frame: CGRect.zero)
            window.addSubview(view)

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

                window.layoutIfNeeded()

                expect(view.frame.minY).to(equal(0))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.top <= view.superview!.top
                    view.top >= view.superview!.top
                }

                window.layoutIfNeeded()

                expect(view.frame.minY).to(equal(0))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.top == view.superview!.top + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.minY).to(equal(100))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.top == view.superview!.top - 100
                }

                window.layoutIfNeeded()

                expect(view.frame.minY).to(equal(-100))
            }
        }

        describe("LayoutProxy.right") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.right == view.superview!.right
                }

                window.layoutIfNeeded()

                expect(view.frame.maxX).to(equal(400))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.right <= view.superview!.right
                    view.right >= view.superview!.right
                }

                window.layoutIfNeeded()

                expect(view.frame.maxX).to(equal(400))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.right == view.superview!.right + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.maxX).to(equal(500))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.right == view.superview!.right - 100
                }

                window.layoutIfNeeded()

                expect(view.frame.maxX).to(equal(300))
            }
        }

        describe("LayoutProxy.bottom") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.bottom == view.superview!.bottom
                }

                window.layoutIfNeeded()

                expect(view.frame.maxY).to(equal(400))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.bottom <= view.superview!.bottom
                    view.bottom >= view.superview!.bottom
                }

                window.layoutIfNeeded()

                expect(view.frame.maxY).to(equal(400))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.bottom == view.superview!.bottom + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.maxY).to(equal(500))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.bottom == view.superview!.bottom - 100
                }

                window.layoutIfNeeded()

                expect(view.frame.maxY).to(equal(300))
            }
        }

        describe("LayoutProxy.left") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.left == view.superview!.left
                }

                window.layoutIfNeeded()

                expect(view.frame.minX).to(equal(0))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.left <= view.superview!.left
                    view.left >= view.superview!.left
                }

                window.layoutIfNeeded()

                expect(view.frame.minX).to(equal(0))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.left == view.superview!.left + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.minX).to(equal(100))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.left == view.superview!.left - 100
                }

                window.layoutIfNeeded()

                expect(view.frame.minX).to(equal(-100))
            }
        }

        describe("LayoutProxy.centerX") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX
                }

                window.layoutIfNeeded()

                expect(view.frame.midX).to(equal(200))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.centerX <= view.superview!.centerX
                    view.centerX >= view.superview!.centerX
                }

                window.layoutIfNeeded()

                expect(view.frame.midX).to(equal(200))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.midX).to(equal(300))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX - 100
                }

                window.layoutIfNeeded()

                expect(view.frame.midX).to(equal(100))
            }

            it("should support multiplication") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX * 2
                }

                window.layoutIfNeeded()

                expect(view.frame.midX).to(equal(400))
            }

            it("should support division") {
                constrain(view) { view in
                    view.centerX == view.superview!.centerX / 2
                }

                window.layoutIfNeeded()

                expect(view.frame.midX).to(equal(100))
            }
        }

        describe("LayoutProxy.centerY") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.centerY == view.superview!.centerY
                }

                window.layoutIfNeeded()

                expect(view.frame.midY).to(equal(200))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.centerY <= view.superview!.centerY
                    view.centerY >= view.superview!.centerY
                }

                window.layoutIfNeeded()

                expect(view.frame.midY).to(equal(200))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.centerY == view.superview!.centerY + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.midY).to(equal(300))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.centerY == view.superview!.centerY - 100
                }

                window.layoutIfNeeded()

                expect(view.frame.midY).to(equal(100))
            }

            it("should support multiplication") {
                constrain(view) { view in
                    view.centerY == view.superview!.centerY * 2
                }

                window.layoutIfNeeded()

                expect(view.frame.midY).to(equal(400))
            }

            it("should support division") {
                constrain(view) { view in
                    view.centerY == view.superview!.centerY / 2
                }

                window.layoutIfNeeded()

                expect(view.frame.midY).to(equal(100))
            }
        }

#if os(iOS) || os(tvOS)
        describe("on iOS only") {
            beforeEach {
                window.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
            }

            describe("LayoutProxy.topMargin") {
                it("should support relative equalities") {
                    constrain(view) { view in
                        view.top == view.superview!.topMargin
                    }

                    window.layoutIfNeeded()

                    expect(view.frame.minY).to(equal(10))
                }
            }

            describe("LayoutProxy.rightMargin") {
                it("should support relative equalities") {
                    constrain(view) { view in
                        view.right == view.superview!.rightMargin
                    }

                    window.layoutIfNeeded()

                    expect(view.frame.maxX).to(equal(360))
                }
            }

            describe("LayoutProxy.bottomMargin") {
                it("should support relative equalities") {
                    constrain(view) { view in
                        view.bottom == view.superview!.bottomMargin
                    }

                    window.layoutIfNeeded()

                    expect(view.frame.maxY).to(equal(370))
                }
            }

            describe("LayoutProxy.leftMargin") {
                it("should support relative equalities") {
                    constrain(view) { view in
                        view.left == view.superview!.leftMargin
                    }

                    window.layoutIfNeeded()

                    expect(view.frame.minX).to(equal(20))
                }
            }
        }
#endif
    }
}
