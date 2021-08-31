//
//  locationsApp.swift
//  watch-locations Extension
//
//  Created by Saba Khutsishvili on 31.08.21.
//

import SwiftUI

@main
struct locationsApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
