//
//  ModelData.swift
//  locations
//
//  Created by Saba Khutsishvili on 28.08.21.
//

import Foundation

final class ModelData: ObservableObject {
    
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    @Published var profile = Profile.default
    
    var hikes: [Hike] = load("hikeData.json")
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
}
