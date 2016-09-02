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
            window = TestWindow(frame: CGRect(x: 0,y: 0, width: 400, height: 400))
            
            view = TestView(frame: CGRect.zero)
            
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
                
                expect(view.convert(view.bounds, to: window).minY).to(equal(viewController.topLayoutGuide.length))
            }
            
            it("should support relative inequalities") {
                constrain(view) { view in
                    view.top <= viewController.topLayoutGuideCartography
                    view.top >= viewController.topLayoutGuideCartography
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.convert(view.bounds, to: window).minY).to(equal(viewController.topLayoutGuide.length))
            }
            
            it("should support addition") {
                constrain(view) { view in
                    view.top == viewController.topLayoutGuideCartography + 100
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.convert(view.bounds, to: window).minY).to(equal(100 + viewController.topLayoutGuide.length))
            }
            
            it("should support subtraction") {
                constrain(view) { view in
                    view.top == viewController.topLayoutGuideCartography - 100
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.convert(view.bounds, to: window).minY).to(equal(-100 - viewController.topLayoutGuide.length))
            }
        }
        
        describe("LayoutSupport.bottom") {
            it("should support relative equalities") {
                constrain(view) { view in
                    view.bottom == viewController.bottomLayoutGuideCartography
                }
                viewController.view.layoutIfNeeded()
                
                expect(view.convert(view.bounds, to: window).maxY).to(equal(window.bounds.maxY - viewController.bottomLayoutGuide.length))
            }
            
            it("should support relative inequalities") {
                constrain(view) { view in
                    view.bottom <= viewController.bottomLayoutGuideCartography
                    view.bottom >= viewController.bottomLayoutGuideCartography
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.convert(view.bounds, to: window).maxY).to(equal(window.bounds.maxY - viewController.bottomLayoutGuide.length))
            }
            
            it("should support addition") {
                constrain(view) { view in
                    view.bottom == viewController.bottomLayoutGuideCartography + 100
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.convert(view.bounds, to: window).maxY).to(equal(100 + window.bounds.maxY - viewController.bottomLayoutGuide.length))
            }
            
            it("should support subtraction") {
                constrain(view) { view in
                    view.bottom == viewController.bottomLayoutGuideCartography - 100
                }
                
                viewController.view.layoutIfNeeded()
                
                expect(view.convert(view.bounds, to: window).maxY).to(equal((window.bounds.maxY - 100) - viewController.bottomLayoutGuide.length))
            }
            
        }

    }
}
