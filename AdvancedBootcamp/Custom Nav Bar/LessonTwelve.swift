//
//  LessonTwelve.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-06-04.
//

import SwiftUI

struct LessonTwelve: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                CustomNavLink {
                    Text("Destination")
                        .customNavBarItems(
                            title: "Second View",
                            subtitle: nil,
                            backButtonHidden: false
                        )
                } label: {
                    Text("Navgiate")
                }

            }
            .customNavigationTitle("Hello")
            .customNavigationSubitle("This is a test")
            .customNavigationBackButtonHidden(true)
        }
    }
    
    private var defaultNavView: some View {
        NavigationStack {
            ZStack {
                Color.orange.ignoresSafeArea()
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("Destination Title")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    Text("Navigate")
                }

            }
            .navigationTitle("Nav title here")
        }
    }
}

#Preview {
    LessonTwelve()
}
