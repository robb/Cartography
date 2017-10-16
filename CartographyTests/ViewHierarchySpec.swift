import Cartography

import Nimble
import Quick

class ViewHierarchySpec: QuickSpec {
    override func spec() {
        describe("Finding the common superview") {
            pending("should throw an exception if the views share no common ancestor") {
                let viewA = TestView()
                let viewB = TestView()

                expect({
                    constrain(viewA, viewB) { viewA, viewB in
                        viewA.width == viewB.width
                    }
                }()).to(raiseException())
            }

            it("should consider a view its own closest common ancestor") {
                let view = TestView()

                constrain(view) { view in
                    view.width  == 200
                }

                expect(view.constraints.count).to(equal(1))
            }

            it("should handle a direct parent-child-relationship") {
                let parent = TestView()
                let child = TestView()

                parent.addSubview(child)

                constrain(parent, child) { parent, child in
                    parent.width == child.width
                }

                expect(parent.constraints.count).to(equal(1))
            }

            it("should handle a grandparent-child-relationship") {
                let grandparent = TestView()
                let parent = TestView()
                let child = TestView()

                grandparent.addSubview(parent)
                parent.addSubview(child)

                constrain(grandparent, child) { grandparent, child in
                    grandparent.width == child.width
                }

                expect(grandparent.constraints.count).to(equal(1))
            }

            it("should handle views that share a parent") {
                let parent = TestView()
                let childA = TestView()
                let childB = TestView()

                parent.addSubview(childA)
                parent.addSubview(childB)

                constrain(childA, childB) { childA, childB in
                    childA.width == childB.width
                }

                expect(parent.constraints.count).to(equal(1))
            }

            it("should handle views that share a grandparent") {
                let grandparent = TestView()
                let parentA = TestView()
                let parentB = TestView()
                let childA = TestView()
                let childB = TestView()

                grandparent.addSubview(parentA)
                grandparent.addSubview(parentB)
                parentA.addSubview(childA)
                parentB.addSubview(childB)

                constrain(childA, childB) { childA, childB in
                    childA.width == childB.width
                }

                expect(grandparent.constraints.count).to(equal(1))
            }

            it("should handle asymmetric view hierachies") {
                let grandparent = TestView()
                let parentA = TestView()
                let parentB = TestView()
                let childA = TestView()

                grandparent.addSubview(parentA)
                grandparent.addSubview(parentB)
                parentA.addSubview(childA)

                constrain(childA, parentB) { childA, parentB in
                    childA.width == parentB.width
                }

                expect(grandparent.constraints.count).to(equal(1))
            }
        }
    }
}
