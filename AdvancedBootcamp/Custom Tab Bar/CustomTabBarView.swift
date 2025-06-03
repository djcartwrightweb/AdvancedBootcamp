//
//  CustomTabBarView.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-06-03.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Namespace private var namespace
    
    let tab: [TabBarItem]
    @Binding var selection: TabBarItem
    
    @State var localSelection: TabBarItem
    
    var body: some View {
//        tabBarV1
        tabBarV2
            .onChange(of: selection) { _, newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

extension CustomTabBarView {
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundStyle(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? tab.color.opacity(0.2) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var tabBarV1 : some View {
        HStack {
            ForEach(tab, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
}

extension CustomTabBarView {
    private func tabView2(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundStyle(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var tabBarV2 : some View {
        HStack {
            ForEach(tab, id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}

#Preview {
    
    let tabBarItems: [TabBarItem] = [
        .home, .music, .profile
    ]
    VStack {
        Spacer()
        CustomTabBarView(tab: tabBarItems, selection: .constant(tabBarItems.first!), localSelection: tabBarItems.first!)
    }
}


