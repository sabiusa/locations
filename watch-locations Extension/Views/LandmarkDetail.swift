//
//  LandmarkDetail.swift
//  watch-locations Extension
//
//  Created by Saba Khutsishvili on 31.08.21.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex { $0.id == landmark.id }!
    }
    
    var body: some View {
        Text("Text")
    }
    
}

struct LandmarkDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        let modelData = ModelData()
        
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
    
}
