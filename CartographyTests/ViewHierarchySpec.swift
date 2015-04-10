import Cartography

import Nimble
import Quick

class ViewHierarchySpec: QuickSpec {
    override func spec() {
        describe("Finding the common superview") {
            it("should return nil if there is no common ancestor") {
                let viewA = TestView()
                let viewB = TestView()

                expect(closestCommonAncestor(viewA, viewB)).to(beNil())
                expect(closestCommonAncestor(viewB, viewA)).to(beNil())
            }

            it("should consider a view its own closest common ancestor") {
                let view = TestView()

                expect(closestCommonAncestor(view, view)).to(equal(view))
            }

            it("should handle a direct parent-child-relationship") {
                let parent = TestView()
                let child = TestView()

                parent.addSubview(child)

                expect(closestCommonAncestor(parent, child)).to(equal(parent))
                expect(closestCommonAncestor(child, parent)).to(equal(parent))
            }

            it("should handle a grandparent-child-relationship") {
                let grandparent = TestView()
                let parent = TestView()
                let child = TestView()

                grandparent.addSubview(parent)
                parent.addSubview(child)

                expect(closestCommonAncestor(grandparent, child)).to(equal(grandparent))
                expect(closestCommonAncestor(child, grandparent)).to(equal(grandparent))
            }

            it("should handle views that share a parent") {
                let parent = TestView()
                let childA = TestView()
                let childB = TestView()

                parent.addSubview(childA)
                parent.addSubview(childB)

                expect(closestCommonAncestor(childA, childB)).to(equal(parent))
                expect(closestCommonAncestor(childB, childA)).to(equal(parent))
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

                expect(closestCommonAncestor(childA, childB)).to(equal(grandparent))
                expect(closestCommonAncestor(childB, childA)).to(equal(grandparent))
            }

            it("should handle asymmetric view hierachies") {
                let grandparent = TestView()
                let parentA = TestView()
                let parentB = TestView()
                let childA = TestView()

                grandparent.addSubview(parentA)
                grandparent.addSubview(parentB)
                parentA.addSubview(childA)

                expect(closestCommonAncestor(childA, parentB)).to(equal(grandparent))
                expect(closestCommonAncestor(parentB, childA)).to(equal(grandparent))
            }
        }
    }
}
