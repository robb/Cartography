import Cartography

import Nimble
import Quick
import UIKit

class LayoutSupportSpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var view: TestView!
        var viewController: UIViewController!
        var navigationController: UINavigationController!
        var tabBarController: UITabBarController!

        beforeEach {
            window = TestWindow(frame: CGRectMake(0,0,400,400))
            
            view = TestView(frame: CGRectZero)
            
            viewController = UIViewController()
            viewController.view.addSubview(view)
            
            constrain(view) { view in
                view.height == 200
                view.width == 200
            }
            
            navigationController = UINavigationController(rootViewController: viewController)
            tabBarController = UITabBarController()
            tabBarController.viewControllers = [navigationController]
            tabBarController.view.frame = window.bounds
            tabBarController.view.layoutIfNeeded()
            window.rootViewController = tabBarController
            
            window.setNeedsLayout()
            window.layoutIfNeeded()
            
            print(viewController.topLayoutGuide.debugDescription)
        }
        
        describe("LayoutSupport.top") {
            it("should support relative equalities") {
                
                viewController.view.layoutIfNeeded()

                constrain(view) { view in
                    view.top == viewController.topLayoutGuideCartography
                }
                viewController.view.layoutIfNeeded()
                
                expect(view.convertRect(view.bounds, toView: window).minY).to(equal(viewController.topLayoutGuide.length))
            }
            
            it("should support relative inequalities") {
                constrain(view) { view in
                    view.top <= viewController.topLayoutGuideCartography
                    view.top >= viewController.topLayoutGuideCartography
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.convertRect(view.bounds, toView: window).minY).to(equal(viewController.topLayoutGuide.length))
            }
            
            it("should support addition") {
                constrain(view) { view in
                    view.top == viewController.topLayoutGuideCartography + 100
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.convertRect(view.bounds, toView: window).minY).to(equal(100 + viewController.topLayoutGuide.length))
            }
            
            it("should support subtraction") {
                constrain(view) { view in
                    view.top == viewController.topLayoutGuideCartography - 100
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.convertRect(view.bounds, toView: window).minY).to(equal(-100 - viewController.topLayoutGuide.length))
            }
        }
        
        describe("LayoutSupport.bottom") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.bottom == viewController.bottomLayoutGuideCartography
                }
                viewController.view.layoutIfNeeded()
                
                expect(view.convertRect(view.bounds, toView: window).maxY).to(equal(window.bounds.maxY - viewController.bottomLayoutGuide.length))
            }
            
            it("should support relative inequalities") {
                constrain(view) { view in
                    view.bottom <= viewController.bottomLayoutGuideCartography
                    view.bottom >= viewController.bottomLayoutGuideCartography
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.convertRect(view.bounds, toView: window).maxY).to(equal(window.bounds.maxY - viewController.bottomLayoutGuide.length))
            }
            
            it("should support addition") {
                constrain(view) { view in
                    view.bottom == viewController.bottomLayoutGuideCartography + 100
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.convertRect(view.bounds, toView: window).maxY).to(equal(100 + window.bounds.maxY - viewController.bottomLayoutGuide.length))
            }
            
            it("should support subtraction") {
                constrain(view) { view in
                    view.bottom == viewController.bottomLayoutGuideCartography - 100
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.convertRect(view.bounds, toView: window).maxY).to(equal((window.bounds.maxY - 100) - viewController.bottomLayoutGuide.length))
            }
            
        }

    }
}
