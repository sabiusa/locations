//
//  FavoriteButton.swift
//  locations
//
//  Created by Saba Khutsishvili on 29.08.21.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet: Bool
    
    private var imageName: String { isSet ? "star.fill" : "star" }
    private var color: Color { isSet ? Color.yellow : Color.gray }
    
    var body: some View {
        Button(
            action: { isSet.toggle() },
            label: {
                Image(systemName: imageName)
                    .foregroundColor(color)
            }
        )
    }
    
}

struct FavoriteButton_Previews: PreviewProvider {
    
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
            .previewLayout(.sizeThatFits)
    }
    
}
