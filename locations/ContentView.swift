//
//  ContentView.swift
//  locations
//
//  Created by Saba Khutsishvili on 28.08.21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        LandmarkList()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
    
}
