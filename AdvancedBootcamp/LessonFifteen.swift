//
//  LessonFifteen.swift
//  AdvancedBootcamp
//
//  Created by David Cartwright on 2025-06-05.
//

import SwiftUI



struct DefaultColorTheme: ColorThemeProtocol {
    
    var primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
    var primary: Color = .red
    let secondary: Color = .white
    let tertiary: Color = .green
}

struct AnotherColorTheme: ColorThemeProtocol {
    var primary: Color = .pink
    let secondary: Color = .white
    let tertiary: Color = .purple
}

protocol ColorThemeProtocol {
    var primary: Color { get set }
    var secondary: Color { get }
    var tertiary: Color { get }
}

class DefaultDataSource: DataSourceProtocol, ButtonPressedProtocol {
    var buttonText: String = "Protocols are awesome!"
    
    func buttonPressed() {
        print("Button was pressed")
    }
}

class AlternativeDataSource: ButtonDataSourceProtocol {
    var buttonText: String = "They make code more modular!"
    
    func buttonPressed() {
        print("Button was pressed by alternative")
    }
}

protocol DataSourceProtocol {
    var buttonText: String { get }
}

protocol ButtonPressedProtocol {
    func buttonPressed()
}

protocol ButtonDataSourceProtocol: ButtonPressedProtocol, DataSourceProtocol {
    
}

struct LessonFifteen: View {
    
    let colorTheme: ColorThemeProtocol
    let dataSource: ButtonDataSourceProtocol
//    let dataSource: ButtonPressedProtocol & DataSourceProtocol <-- this works also
    
    var body: some View {
        ZStack {
            colorTheme.tertiary.ignoresSafeArea()
            
            Text(dataSource.buttonText)
                .font(.headline)
                .foregroundStyle(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
                .onTapGesture {
                    dataSource.buttonPressed()
                }
        }
    }
}

#Preview {
    LessonFifteen(colorTheme: AlternativeColorTheme(), dataSource: AlternativeDataSource())
}
