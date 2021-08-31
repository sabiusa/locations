//
//  ContentView.swift
//  mac-locations
//
//  Created by Saba Khutsishvili on 31.08.21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
    
}
