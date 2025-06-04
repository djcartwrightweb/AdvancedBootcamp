//
//  CustomNavBarContainerView.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-06-04.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    
    @State private var hideBackButton: Bool = false
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(
                backButtonHidden: hideBackButton,
                title: title,
                subtitle: subtitle
            )
            content
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self) { value in
            self.subtitle = value
        }
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self) { value in
            self.hideBackButton = value
        }
    }
}

#Preview {
    CustomNavBarContainerView {
        ZStack {
            Color.green
                .ignoresSafeArea()
            Text("hi")
                .foregroundStyle(.white)
        }
        .customNavigationTitle("New Title")
        .customNavigationSubitle("New Subb")
    }
}
