//
//  LandmarkList.swift
//  locations
//
//  Created by Saba Khutsishvili on 28.08.21.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    
    @EnvironmentObject var modelData: ModelData
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite) &&
                (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var selectedIndex: Int? {
        modelData.landmarks.firstIndex { $0.id == selectedLandmark?.id }
    }
    
    var body: some View {
        NavigationView {
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu(
                        content: {
                            Picker("Category", selection: $filter) {
                                ForEach(FilterCategory.allCases) { category in
                                    Text(category.rawValue).tag(category)
                                }
                            }
                            .pickerStyle(InlinePickerStyle())
                            
                            Toggle(isOn: $showFavoritesOnly) {
                                Label("Favorites only", systemImage: "star.fill")
                            }
                        },
                        label: {
                            Label("Filter", systemImage: "slider.horizontal.3")
                        }
                    )
                }
            }
            
            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[selectedIndex ?? 0])
    }
    
}

struct LandmarkList_Previews: PreviewProvider {
    
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
    
}
