//
//  LessonThree.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-05-16.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let rotationAngle: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotationAngle))
            .offset(
                x: rotationAngle != 0 ? UIScreen.main.bounds.width : 0,
                y: rotationAngle != 0 ? UIScreen.main.bounds.height : 0)
    }
}

extension AnyTransition {
    static var rotating: AnyTransition {
        modifier(
            active: RotateViewModifier(rotationAngle: 180),
            identity: RotateViewModifier(rotationAngle: 0)
        )
    }
    
    static func rotating(rotation: Double) -> AnyTransition {
        modifier(
            active: RotateViewModifier(rotationAngle: rotation),
            identity: RotateViewModifier(rotationAngle: 0)
        )
    }
    
    static var rotateOn: AnyTransition {
        asymmetric(
                insertion: .rotating,
                removal: .move(edge: .leading)
            )
    }
}

struct LessonThree: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .transition(AnyTransition.rotating.animation(.easeOut(duration: 0.5)))
//                    .transition(.rotating(rotation: 1080))
                    .transition(.rotateOn)
            }
            
            Spacer()
            
            Text("Click Me")
                .withDefaultButtonFormatting()
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

#Preview {
    LessonThree()
}
