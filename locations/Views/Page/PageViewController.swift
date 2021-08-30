//
//  PageViewController.swift
//  locations
//
//  Created by Saba Khutsishvili on 30.08.21.
//

import UIKit
import SwiftUI

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    
    @Binding var currentPage: Int
    
    var pages: [Page]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]],
            direction: .forward,
            animated: true
        )
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { page in
                UIHostingController(rootView: page)
            }
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController)
            else { return nil }
            
            if index == 0 {
                return controllers.last
            } else {
                return controllers[index - 1]
            }
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController
        ) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController)
            else { return nil }
            
            if (index + 1) == controllers.count {
                return controllers.first
            } else {
                return controllers[index + 1]
            }
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool
        ) {
            if completed {
                if let visible = pageViewController.viewControllers?.first {
                    if let index = controllers.firstIndex(of: visible) {
                        parent.currentPage = index
                    }
                }
            }
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
}
