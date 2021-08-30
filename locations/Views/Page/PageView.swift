//
//  PageView.swift
//  locations
//
//  Created by Saba Khutsishvili on 30.08.21.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    @State private var currentPage = 0
    
    var pages: [Page]
    
    var body: some View {
        VStack {
            PageViewController(
                currentPage: $currentPage,
                pages: pages
            )
            
            Text("Current page: \(currentPage)")
        }
    }
    
}

struct PageView_Previews: PreviewProvider {
    
    static var previews: some View {
        PageView(
            pages:
                ModelData().features.map {
                    FeatureCard(landmark: $0)
                }
        )
        .aspectRatio(3 / 2, contentMode: .fit)
    }
    
}
