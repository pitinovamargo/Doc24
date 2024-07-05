//
//  ContentView.swift
//  Doc24
//
//  Created by Margarita Pitinova on 05.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        // первая вкладка таббара
        VStack {
            TabView {
                ZStack {
                    Color.red.edgesIgnoringSafeArea(.top)
                    Text("Красная вкладка")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                .tabItem {
                    Label("Главная", systemImage: "1.square.fill")
                }
                ZStack {
                    Color.blue.edgesIgnoringSafeArea(.top)
                    Text("Синяя вкладка")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                .tabItem {
                    Label("Приёмы", systemImage: "2.square.fill")
                }
                ZStack {
                    Color.blue.edgesIgnoringSafeArea(.top)
                    Text("Синяя вкладка")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                .tabItem {
                    Label("Чат", systemImage: "2.square.fill")
                }
                ZStack {
                    Color.blue.edgesIgnoringSafeArea(.top)
                    Text("Синяя вкладка")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                .tabItem {
                    Label("Профиль", systemImage: "2.square.fill")
                }
            }
            .frame(maxHeight: .infinity)
        }

        
    }
    
    
    
    
    
}

#Preview {
    ContentView()
}
