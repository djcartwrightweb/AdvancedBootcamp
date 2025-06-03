//
//  LessonEleven.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-05-26.
//

import SwiftUI




struct LessonEleven: View {
    
    @State private var tabSelection: TabBarItem = .home

    var body: some View {
//        defaultTabView
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.red
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            Color.blue
                .tabBarItem(tab: .music, selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
    }
}

extension LessonEleven {
    private var defaultTabView: some View {
        TabView {
            Tab("Red", systemImage: "play") {
                Color.red
            }
            
            Tab("Blue", systemImage: "books.vertical") {
                Color.blue
            }
            
            Tab("Orange", systemImage: "magnifyingglass") {
                Color.orange
            }
            
        }
    }
}

#Preview {
    
    LessonEleven()
}
