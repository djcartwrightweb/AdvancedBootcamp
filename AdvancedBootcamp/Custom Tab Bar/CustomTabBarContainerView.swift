//
//  CustomTabBarContainerView.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-06-03.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    public init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            CustomTabBarView(tab: tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

#Preview {
    
    let tabBarItems: [TabBarItem] = [
        .home, .music, .profile
    ]
    
    CustomTabBarContainerView(selection: .constant(tabBarItems.first!)) {
        Color.red
    }
}
