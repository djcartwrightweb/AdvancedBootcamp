//
//  CustomNavBarView.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-06-04.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.dismiss) var dismiss
    let backButtonHidden: Bool
    let title: String
    let subtitle: String?
    
    var body: some View {
        HStack {
            if !backButtonHidden {
                backButton
            }
            
            Spacer()
            
            titleSection
            
            Spacer()
            
            if !backButtonHidden {
                backButton
                    .opacity(0)
            }
            
        }
        .padding()
        .accentColor(.white)
        .foregroundStyle(.white)
        .font(.headline)
        .background(Color.blue.ignoresSafeArea(edges: .top))
    }
}

extension CustomNavBarView {
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle {
                Text(subtitle)
            }
        }
    }
}

#Preview {
    VStack {
        CustomNavBarView(backButtonHidden: true, title: "title", subtitle: "hello")
        Spacer()
    }
}
