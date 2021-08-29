//
//  ModelData.swift
//  locations
//
//  Created by Saba Khutsishvili on 28.08.21.
//

import Foundation

final class ModelData: ObservableObject {
    
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    var hikes: [Hike] = load("hikeData.json")
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
}
