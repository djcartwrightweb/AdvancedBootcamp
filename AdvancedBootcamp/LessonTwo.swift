//
//  LessonTwo.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-05-15.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let amount: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .brightness(configuration.isPressed ? 0.2 : 0)
            .scaleEffect(configuration.isPressed ? amount : 1.0)
    }
}

extension View {
    func withMyStyle(amount: CGFloat = 0.9) -> some View {
        self.buttonStyle(PressableButtonStyle(amount: amount))
    }
}


struct LessonTwo: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Text("Click Me")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
//            .buttonStyle(PressableButtonStyle(amount: 0.7))
            .withMyStyle(amount: 0.7)
            .padding(20)
            
            Button {
                
            } label: {
                Text("Click Me")
                    .withDefaultButtonFormatting()
            }
//            .buttonStyle(PressableButtonStyle())
            .withMyStyle()
            .padding(20)
        }

    }
}

#Preview {
    LessonTwo()
}
