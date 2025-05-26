//
//  LessonTen.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-05-20.
//

import SwiftUI

struct LessonTen_1st: View {
    
    @State private var text: String = "Hello World!"
    
    
    var body: some View {
        NavigationStack {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle("Nav title")
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
            self.text = value
        }
    }
}

struct SecondaryScreen: View {
    
    let text: String
    @State private var newValue: String = ""
    
    var body: some View {
        Text(text)
            .onAppear {
                getDataFromDatabase()
            }
            .customTitle(newValue)
    }
    
    private func getDataFromDatabase() {
        //download fake data
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.newValue = "New Value From Database"
        }
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

extension View {
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

#Preview {
    LessonTen_1st()
}
