//
//  LessonTen-3rd.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-05-26.
//

import SwiftUI

extension View {
    func onScrollViewOffsetChange(action: @escaping (_ offset: CGFloat) -> ()) -> some View {
        self.background(
            GeometryReader { geo in
                Text("")
                    .preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
            }
        )
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self, perform: { value in
            action(value)
        })
    }
}

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct LessonTen_3rd: View {
    
    let title: String = "New Title Here!!!"
    
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack {
                titleLayer
                    .opacity(Double(scrollViewOffset) / 78.0)
                    .onScrollViewOffsetChange { offset in
                        self.scrollViewOffset = offset
                    }
                
                contentLayer
            }
            .padding()
        }
        .overlay {Text("\(scrollViewOffset)")}
        .overlay(alignment: .top) {
            navBarLayer
                .opacity(scrollViewOffset < 20 ? 1.0 : 0)
        }
    }
}

#Preview {
    LessonTen_3rd()
}

extension LessonTen_3rd {
    private var titleLayer: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var contentLayer: some View {
        ForEach(0..<100) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
    
    private var navBarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
}
