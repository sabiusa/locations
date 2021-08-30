//
//  Profile.swift
//  locations
//
//  Created by Saba Khutsishvili on 30.08.21.
//

import Foundation

struct Profile {
    
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    static let `default` = Profile(username: "sabius")

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { self.rawValue }
    }
    
}
