//
//  LandmarkCommands.swift
//  locations
//
//  Created by Saba Khutsishvili on 31.08.21.
//

import SwiftUI

struct LandmarkCommands: Commands {
    
    private struct MenuContent: View {
        
        @FocusedBinding(\.selectedLandmark) var selectedLandmark
        
        private var actionString: String {
            selectedLandmark?.isFavorite == true ? "Remove" : "Mark"
        }
        
        var body: some View {
            Button("\(actionString) as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
        
    }

    var body: some Commands {
        SidebarCommands()
        CommandMenu("Landmark") {
            MenuContent()
        }
    }
    
}

private struct SelectedLandmarkKey: FocusedValueKey {
    
    typealias Value = Binding<Landmark>
    
}

extension FocusedValues {
    
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
    
}
