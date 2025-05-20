//
//  LessonEight.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-05-20.
//

import SwiftUI

struct GenericModel<T> {
    let info: T?
    
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

@Observable class LessonEightViewModel {
    var stringModel = GenericModel(info: "Hello World")
    var boolModel = GenericModel(info: true)
    
    func removeInfo() {
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
    }
}

struct LessonEight: View {
    
    @State private var vm = LessonEightViewModel()
    
    var body: some View {
        VStack {
            
            GenericView {
                Text("Hi there")
                Text("test")
            }
            Text(vm.stringModel.info ?? "No Info")
                .onTapGesture {
                    vm.removeInfo()
                }
            Text(vm.boolModel.info?.description ?? "No Info")
                .onTapGesture {
                    vm.removeInfo()
                }
        }
    }
}

struct GenericView<T: View>: View {
    
    
    let content: () -> T
    
    init(@ViewBuilder content: @escaping () -> T) {
        self.content = content
    }
    
    var body: some View {
        content()
    }
}

#Preview {
    LessonEight()
}
