//
//  HikeView.swift
//  locations
//
//  Created by Saba Khutsishvili on 29.08.21.
//

import SwiftUI

struct HikeView: View {
    
    @State private var showDetail = false
    
    var hike: Hike

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                    .animation(nil)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    
                    Text(hike.distanceText)
                }

                Spacer()

                Button(
                    action: { self.showDetail.toggle() },
                    label: {
                        Image(systemName: "chevron.right.circle")
                            .imageScale(.large)
                            .rotationEffect(.degrees(showDetail ? 90 : 0))
                            .padding()
                    }
                )
            }

            if showDetail {
                HikeDetail(hike: hike)
            }
        }
    }
    
}

struct HikeView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            
            Spacer()
        }
    }
    
}