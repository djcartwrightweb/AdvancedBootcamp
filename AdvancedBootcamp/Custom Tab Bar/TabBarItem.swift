//
//  TabBarItem.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-06-03.
//

import SwiftUI


//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case home, music, profile
    
    var iconName: String {
        switch self {
            case .home: "house"
            case .music: "music.note"
            case .profile: "person"
        }
    }
    
    var title: String {
        switch self {
            case .home: "Home"
            case .music: "Music"
            case .profile: "Profile"
        }
    }
    
    var color: Color {
        switch self {
            case .home: .red
            case .music: .blue
            case .profile: .green
        }
    }
}
