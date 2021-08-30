//
//  FeatureCard.swift
//  locations
//
//  Created by Saba Khutsishvili on 30.08.21.
//

import SwiftUI

struct FeatureCard: View {
    
    var landmark: Landmark
    
    var body: some View {
        landmark.featuredImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay(TextOverlay(landmark: landmark))
    }
    
}

struct FeatureCard_Previews: PreviewProvider {
    
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
    
}
