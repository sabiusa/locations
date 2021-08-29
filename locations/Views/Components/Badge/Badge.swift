//
//  Badge.swift
//  locations
//
//  Created by Saba Khutsishvili on 29.08.21.
//

import SwiftUI

struct Badge: View {
    
    static let rotationCount = 8
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                ForEach(0 ..< Self.rotationCount) { i in
                    RotatedBadgeSymbol(
                        angle: .degrees(Double(i) / Double(Self.rotationCount)) * 360.0
                    )
                }
                .opacity(0.5)
                .scaleEffect(0.25, anchor: .top)
                .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
    
}

struct Badge_Previews: PreviewProvider {
    
    static var previews: some View {
        Badge()
    }
    
}
