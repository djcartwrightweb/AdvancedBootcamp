//
//  LessonTen-2nd.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-05-26.
//

import SwiftUI

struct LessonTen_2nd: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Spacer(minLength: 200)
            Text("Hello, World!")
                .frame(width: rectSize.width, height: rectSize.height)
                .border(Color.black)
                .background(Color.blue)
            Spacer()
            HStack {
                Rectangle()
                
                GeometryReader { geometry in
                    Rectangle()
                        .updateRectangleGeometrySize(geometry.size)
                }
                
                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeometrySizePreferenceKey.self) { value in
            self.rectSize = value
        }
    }
}

extension View {
    func updateRectangleGeometrySize(_ size: CGSize) -> some View {
        self.preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
}

struct RectangleGeometrySizePreferenceKey: PreferenceKey {
    static let defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}



#Preview {
    LessonTen_2nd()
}
