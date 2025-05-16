//
//  LessonFour.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-05-16.
//

import SwiftUI

struct LessonFour: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !isClicked {
                Circle()
                    .matchedGeometryEffect(id: "1", in: namespace)
                    .frame(width: 100, height: 100)
            }
            
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "1", in: namespace)
                    .frame(width: 200, height: 300)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct LessonFourTest: View {
    
    let categories: [String] = ["Home", "Popular", "Save"]
    @State private var selected: String = ""
    @Namespace private var namespace2
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack(alignment: .bottom) {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "bg", in: namespace2)
                            .frame(width: 35, height: 2)
                            .offset(y: 15)
                    }
                    Text(category)
                        .foregroundStyle(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation {
                        selected = category
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    LessonFourTest()
}
