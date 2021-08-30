//
//  CategoryHome.swift
//  locations
//
//  Created by Saba Khutsishvili on 29.08.21.
//

import SwiftUI

struct CategoryHome: View {
    
    @State private var showingProfile = false
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(
                        categoryName: key,
                        items: modelData.categories[key]!
                    )
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
            .toolbar {
                Button(
                    action: { showingProfile.toggle() },
                    label: {
                        Image(systemName: "person.crop.circle")
                            .accessibilityLabel("User Profile")
                    }
                )
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
    
}

struct CategoryHome_Previews: PreviewProvider {
    
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
    
}
