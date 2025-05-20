//
//  LessonSeven.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-05-17.
//

import SwiftUI

struct LessonSeven: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: isAnimating ? 60 : 0)
//            RectangleWithSingleCornerAnimation(cornerRadius: isAnimating ? 60 : 0)
            PacMan(offsetAmount: isAnimating ? 20 : 0)
                .frame(width: 250, height: 250)
        }
        .onAppear() {
            withAnimation(Animation.easeInOut.repeatForever()) {
                isAnimating.toggle()
            }
        }
    }
}

struct RectangleWithSingleCornerAnimation: Shape {
    
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 360),
                clockwise: false
            )
            
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct PacMan: Shape {
    
    var offsetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { offsetAmount }
        set { offsetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: offsetAmount),
                endAngle: Angle(degrees: 360-offsetAmount),
                clockwise: false
            )
        }
    }
}

#Preview {
    LessonSeven()
}
