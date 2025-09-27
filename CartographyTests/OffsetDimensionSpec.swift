import Cartography

import Nimble
import Quick

class OffsetDimensionSpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var view: TestView!

        beforeEach {
            window = TestWindow(frame: CGRect(x: 0, y: 0, width: 600, height: 600))

            view = TestView(frame: CGRect.zero)
            
            constrain(view) { view in
                view.height == 200
                view.width == 200
            }
            
            window.addSubview(view)
        }

        describe("X-Axis Offset") {
            it("should support relative equalities to other offsets") {
                constrain(view) { view in
                    view.superview!.left |-| view.left == view.right |-| view.superview!.right
                }

                window.layoutIfNeeded()

                expect(view.frame.minX).to(equal(200))
            }
            
            it("should support relative equalities to real dimensions") {
                constrain(view) { view in
                    view.superview!.left |-| view.left == view.width
                    view.width == view.right |-| view.superview!.right
                }
                
                window.layoutIfNeeded()

                expect(view.frame.minX).to(equal(200))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.superview!.left |-| view.left >= view.width
                    view.superview!.left |-| view.left <= view.width
                }

                window.layoutIfNeeded()

                expect(view.frame.minX).to(equal(200))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.superview!.left |-| view.left == view.width + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.minX).to(equal(300))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.superview!.left |-| view.left == view.width - 100
                }

                window.layoutIfNeeded()

                expect(view.frame.minX).to(equal(100))
            }

            it("should support multiplication") {
                constrain(view) { view in
                    view.superview!.left |-| view.left == view.width * 2
                }

                window.layoutIfNeeded()

                expect(view.frame.minX).to(equal(400))
            }

            it("should support division") {
                constrain(view) { view in
                    view.superview!.left |-| view.left == view.width / 2
                }

                window.layoutIfNeeded()

                expect(view.frame.minX).to(equal(100))
            }

            it("should support complex expressions") {
                constrain(view) { view in
                    view.superview!.left |-| view.left == view.width / 2 + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.minX).to(equal(200))
            }

            it("should support numerical equalities") {
                constrain(view) { view in
                    view.superview!.left |-| view.left == 200
                }

                window.layoutIfNeeded()

                expect(view.frame.minX).to(equal(200))
            }
        }
        
        describe("Y-Axis Offset") {
            it("should support relative equalities to other offsets") {
                constrain(view) { view in
                    view.superview!.top |-| view.top == view.bottom |-| view.superview!.bottom
                }

                window.layoutIfNeeded()

                expect(view.frame.minY).to(equal(200))
            }
            
            it("should support relative equalities to real dimensions") {
                constrain(view) { view in
                    view.superview!.top |-| view.top == view.height
                    view.height == view.bottom |-| view.superview!.bottom
                }
                
                window.layoutIfNeeded()

                expect(view.frame.minY).to(equal(200))
            }

            it("should support relative inequalities") {
                constrain(view) { view in
                    view.superview!.top |-| view.top >= view.width
                    view.superview!.top |-| view.top <= view.width
                }

                window.layoutIfNeeded()

                expect(view.frame.minY).to(equal(200))
            }

            it("should support addition") {
                constrain(view) { view in
                    view.superview!.top |-| view.top == view.height + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.minY).to(equal(300))
            }

            it("should support subtraction") {
                constrain(view) { view in
                    view.superview!.top |-| view.top == view.height - 100
                }

                window.layoutIfNeeded()

                expect(view.frame.minY).to(equal(100))
            }

            it("should support multiplication") {
                constrain(view) { view in
                    view.superview!.top |-| view.top == view.height * 2
                }

                window.layoutIfNeeded()

                expect(view.frame.minY).to(equal(400))
            }

            it("should support division") {
                constrain(view) { view in
                    view.superview!.top |-| view.top == view.height / 2
                }

                window.layoutIfNeeded()

                expect(view.frame.minY).to(equal(100))
            }

            it("should support complex expressions") {
                constrain(view) { view in
                    view.superview!.top |-| view.top == view.height / 2 + 100
                }

                window.layoutIfNeeded()

                expect(view.frame.minY).to(equal(200))
            }

            it("should support numerical equalities") {
                constrain(view) { view in
                    view.superview!.top |-| view.top == 200
                }

                window.layoutIfNeeded()

                expect(view.frame.minY).to(equal(200))
            }
        }
    }
}
