//
//  PageControl.swift
//  locations
//
//  Created by Saba Khutsishvili on 30.08.21.
//

import UIKit
import SwiftUI

struct PageControl: UIViewRepresentable {
    
    @Binding var currentPage: Int
    
    var numberOfPages: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )
        
        return control
    }
    
    func updateUIView(_ pageControl: UIPageControl, context: Context) {
        pageControl.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        
        var control: PageControl
        
        init(control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(control: self)
    }
    
}
