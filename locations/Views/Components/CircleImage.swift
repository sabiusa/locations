//
//  CircleImage.swift
//  locations
//
//  Created by Saba Khutsishvili on 28.08.21.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 8)
    }
    
}

struct CircleImage_Previews: PreviewProvider {
    
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
            .previewLayout(.sizeThatFits)
    }
    
}
