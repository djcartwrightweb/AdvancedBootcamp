//
//  LessonNine.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-05-20.
//

import SwiftUI

struct HeaderViewRegular: View {
    
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            if let iconName {
                Image(systemName: iconName)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct HeaderviewGeneric<T: View>: View {
    
    let title: String
    @ViewBuilder let content: () -> T
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content()
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct LessonNine: View {
    var body: some View {
        
        VStack {
            
            HeaderViewRegular(title: "Hello", description: "this", iconName: "heart.fill")
            HeaderViewRegular(title: "Another", description: nil, iconName: nil)
            
            HeaderviewGeneric(title: "Generic") {
                VStack {
                    Text("Hi")
                    Image(systemName: "heart.fill")
                }
                Text("Nope")
            }
            
            Spacer()
        }
    }
}

struct LocalViewBuilder: View {
    
    enum ViewType {
        case one, two, three
    }
    
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
        }
    }
    
    @ViewBuilder private var headerSection: some View {
        
        switch type {
        case .one:
            viewOne
        case .two:
            viewTow
        case .three:
            viewThree
        }
    }
    
    private var viewOne: some View {
        Text("hi")
    }
    
    private var viewTow: some View {
        VStack {
            Text("two")
            Image(systemName: "heart.fill")
        }

    }
    
    private var viewThree: some View {
        Image(systemName: "heart.fill")
    }
}

#Preview {
    LocalViewBuilder(type: .one)
}
