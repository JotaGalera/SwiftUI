import Foundation
import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    
    @Binding var currentPageIndex: Int
    var viewController: [UIViewController]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [viewController[currentPageIndex]],
            direction: .forward,
            animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
        
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController){
            parent = pageViewController
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.viewController.firstIndex(of: viewController) else { return nil }
            
            if index == 0 { return parent.viewController.last }
            
            return parent.viewController[index - 1]
        }
        
         func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.viewController.firstIndex(of: viewController) else { return nil }
            
            if index + 1 == parent.viewController.count {
                return parent.viewController.first
            }
            
            return parent.viewController[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
                let visibleViewController =
                pageViewController.viewControllers?.first,
                let index = parent.viewController.firstIndex(of: visibleViewController){
                parent.currentPageIndex = index
            }
        }
    }
}
