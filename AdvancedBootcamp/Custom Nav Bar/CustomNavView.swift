//
//  CustomNavView.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-06-04.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack {
            CustomNavBarContainerView {
                content
            }
            .toolbarVisibility(.hidden, for: .navigationBar)
        }
    }
}

extension UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
    
}

#Preview {
    CustomNavView {
        Color.orange.ignoresSafeArea()
    }
}
