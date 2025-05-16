//
//  ContentView.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-05-15.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    func withDefaultButtonFormatting(_ backgroundColor: Color = Color.blue) -> some View {
//        self.modifier(DefaultButtonViewModifier())
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct LessonOne: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .withDefaultButtonFormatting()
            
            Text("Hello, World! 2")
                .withDefaultButtonFormatting(Color.orange)
                
            Text("Hello, World! 3")
                .withDefaultButtonFormatting(Color.mint)
                
            
        }
    }
}

#Preview {
    LessonOne()
}
