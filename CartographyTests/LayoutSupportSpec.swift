import Cartography

import Nimble
import Quick
import UIKit

class LayoutSupportSpec: QuickSpec {
    override func spec() {
        var window: TestWindow!
        var view: TestView!
        var viewController: UIViewController!
        
        beforeEach {
            window = TestWindow(frame: CGRectMake(0,0,400,400))
            
            view = TestView(frame: CGRectZero)
            
            viewController = UIViewController()
            viewController.view.addSubview(view)
            
            constrain(view) { view in
                view.height == 200
                view.width == 200
            }
            
            let navigationController = UINavigationController(rootViewController: viewController)
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = [navigationController]
            tabBarController.view.frame = window.bounds
            tabBarController.view.layoutIfNeeded()
            window.rootViewController = tabBarController
            
        }
        
        describe("LayoutSupport.top") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.top == viewController.topLayoutGuideCartography
                }
                viewController.view.layoutIfNeeded()
                
                expect(view.frame.minY).to(equal(0))
            }
            
            it("should support relative inequalities") {
                constrain(view) { view in
                    view.top <= viewController.topLayoutGuideCartography
                    view.top >= viewController.topLayoutGuideCartography
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.frame.minY).to(equal(0))
            }
            
            it("should support addition") {
                constrain(view) { view in
                    view.top == viewController.topLayoutGuideCartography + 100
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.frame.minY).to(equal(100))
            }
            
            it("should support subtraction") {
                constrain(view) { view in
                    view.top == viewController.topLayoutGuideCartography - 100
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.frame.minY).to(equal(-100))
            }
        }
        
        describe("LayoutSupport.bottom") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.top == viewController.bottomLayoutGuideCartography
                }
                viewController.view.layoutIfNeeded()
                
                expect(view.frame.minY).to(equal(400))
            }
            
            it("should support relative inequalities") {
                constrain(view) { view in
                    view.top <= viewController.bottomLayoutGuideCartography
                    view.top >= viewController.bottomLayoutGuideCartography
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.frame.minY).to(equal(400))
            }
            
            it("should support addition") {
                constrain(view) { view in
                    view.top == viewController.bottomLayoutGuideCartography + 100
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.frame.minY).to(equal(500))
            }
            
            it("should support subtraction") {
                constrain(view) { view in
                    view.top == viewController.bottomLayoutGuideCartography - 100
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.frame.minY).to(equal(300))
            }
            
        }

    }
}