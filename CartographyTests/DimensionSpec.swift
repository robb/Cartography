import Cartography

import Nimble
import Quick

class DimensionSpec: QuickSpec {
    override func spec() {
        var superview: View!
        var view: View!

        beforeEach {
            superview = TestView(frame: CGRectMake(0, 0, 400, 400))

            view = TestView(frame: CGRectZero)
            superview.addSubview(view)
        }

        describe("LayoutProxy.width") {
            it("should support relative equalities") {
                layout(view) { view in
                    view.width == view.superview!.width
                }

                expect(view.frame.width).to(equal(400))
            }

            it("should support relative inequalities") {
                layout(view) { view in
                    view.width <= view.superview!.width
                    view.width >= view.superview!.width
                }

                expect(view.frame.width).to(equal(400))
            }

            it("should support addition") {
                layout(view) { view in
                    view.width == view.superview!.width + 100
                }

                expect(view.frame.width).to(equal(500))
            }

            it("should support subtraction") {
                layout(view) { view in
                    view.width == view.superview!.width - 100
                }

                expect(view.frame.width).to(equal(300))
            }

            it("should support multiplication") {
                layout(view) { view in
                    view.width == view.superview!.width * 2
                }

                expect(view.frame.width).to(equal(800))
            }

            it("should support division") {
                layout(view) { view in
                    view.width == view.superview!.width / 2
                }

                expect(view.frame.width).to(equal(200))
            }

            it("should support complex expressions") {
                layout(view) { view in
                    view.width == view.superview!.width / 2 + 100
                }

                expect(view.frame.width).to(equal(300))
            }

            it("should support numerical equalities") {
                layout(view) { view in
                    view.width == 200
                }

                expect(view.frame.width).to(equal(200))
            }
        }

        describe("LayoutProxy.height") {
            it("should support relative equalities") {
                layout(view) { view in
                    view.height == view.superview!.height
                }

                expect(view.frame.height).to(equal(400))
            }

            it("should support relative inequalities") {
                layout(view) { view in
                    view.height <= view.superview!.height
                    view.height >= view.superview!.height
                }

                expect(view.frame.height).to(equal(400))
            }

            it("should support addition") {
                layout(view) { view in
                    view.height == view.superview!.height + 100
                }

                expect(view.frame.height).to(equal(500))
            }

            it("should support subtraction") {
                layout(view) { view in
                    view.height == view.superview!.height - 100
                }

                expect(view.frame.height).to(equal(300))
            }

            it("should support multiplication") {
                layout(view) { view in
                    view.height == view.superview!.height * 2
                }

                expect(view.frame.height).to(equal(800))
            }

            it("should support division") {
                layout(view) { view in
                    view.height == view.superview!.height / 2
                }

                expect(view.frame.height).to(equal(200))
            }

            it("should support complex expressions") {
                layout(view) { view in
                    view.height == view.superview!.height / 2 + 100
                }

                expect(view.frame.height).to(equal(300))
            }

            it("should support numerical equalities") {
                layout(view) { view in
                    view.height == 200
                }

                expect(view.frame.height).to(equal(200))
            }
        }
    }
}
