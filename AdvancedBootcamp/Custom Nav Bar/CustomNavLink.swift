//
//  CustomNavLink.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-06-04.
//

import SwiftUI


//
//struct CustomNavLink<Destination: View, Label: View>: View {
//    
//    let destination: Destination
//    let label: () -> Label
//    
//    init(@ViewBuilder destination: () -> Destination, @ViewBuilder label: @escaping() -> Label) {
//        self.destination = destination()
//        self.label = label
//    }
//    
//    var body: some View {
//        NavigationLink {
//            destination
//        } label: {
//            label()
//        }
//
//    }
//}


struct CustomNavLink<Destination: View, Label: View>: View {
    
    let destination: () -> Destination
    let label: Label
    
    init(@ViewBuilder destination: @escaping () -> Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination  // Store closure for lazy evaluation
        self.label = label()           // Evaluate immediately since it's displayed right away
    }
    
    var body: some View {
        NavigationLink {
            CustomNavBarContainerView {
                destination()  // Call closure only when navigating
            }
            .toolbarVisibility(.hidden, for: .navigationBar) //hide nav bar in destination
        } label: {
            label         // Use pre-evaluated label
        }
    }
}

#Preview {
    CustomNavView {
        CustomNavLink {
            Text("Destination")
        } label: {
            Text("Label")
        }
    }

}
