//
//  LessonSix.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-05-16.
//

import SwiftUI

struct ArcSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 40),
                clockwise: true
            )
        }
    }
}

struct ShapeWithArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            //top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            //top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            //mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            //bottom
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
            
            //mid-left
            path.addLine(to: CGPoint(x: rect.minY, y: rect.midY))
        }
    }
}

struct QuadSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.maxX + 50, y: rect.minY)
            )
        }
    }
}

struct WaterShape: Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.40)
            )
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.60)
            )
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct LessonSix: View {
    var body: some View {
        VStack {
//            ArcSample()
//                .stroke(style: StrokeStyle(lineWidth: 10))
//                .fill(Color.red)
//                .frame(width: 200, height: 200)
            
            
//            ArcSample()
//                .fill(Color.red)
//                .frame(width: 200, height: 200)
//                .rotationEffect(Angle(degrees: 90))
            
            WaterShape()
                .fill(
                    LinearGradient(
                        colors: [Color.blue, Color.green],
                        startPoint: .bottom,
                        endPoint: .leading
                    )
                )
                .ignoresSafeArea()
            
//            QuadSample()
//                .fill(Color.red)
//                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    LessonSix()
}
