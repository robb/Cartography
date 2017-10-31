import Cartography

import Nimble
import Quick

class SizeSpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var view: TestView!

        beforeEach {
            window = TestWindow(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

            view = TestView(frame: CGRect.zero)
            window.addSubview(view)
        }

        describe("LayoutProxy.size") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.size == view.superview!.size
                }

                window.layoutIfNeeded()

                expect(view.frame.size).to(equal(CGSize(width: 400, height: 400)))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.size <= view.superview!.size
                    view.size >= view.superview!.size
                }

                window.layoutIfNeeded()

                expect(view.frame.size).to(equal(CGSize(width: 400, height: 400)))
            }

            it("should support multiplication") {
                constrain(view) { view in
                    view.size == view.superview!.size * 2
                }

                window.layoutIfNeeded()

                expect(view.frame.size).to(equal(CGSize(width: 800, height: 800)))
            }

            it("should support division") {
                constrain(view) { view in
                    view.size == view.superview!.size / 2
                }

                window.layoutIfNeeded()

                expect(view.frame.size).to(equal(CGSize(width: 200, height: 200)))
            }
        }
    }
}
