//
//  ContentView.swift
//  Doc24
//
//  Created by Margarita Pitinova on 05.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchDoctor = ""
    
    var body: some View {
        // первая вкладка таббара
        VStack {
            TabView {
                ZStack {
                    Color.grayLight.edgesIgnoringSafeArea(.top)
                    Text("Педиатры")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    TextField("Поиск", text: $searchDoctor)
                        .padding(.horizontal, 16)
                        .frame(height: 48)
                        .background(Color.white)
                        .foregroundColor(Color.gray)
                        .clipShape(
                            UnevenRoundedRectangle(
                                topLeadingRadius: 0,
                                bottomLeadingRadius: 20,
                                bottomTrailingRadius: 20,
                                topTrailingRadius: 0
                            )
                        )
                }
                .background(Color.white)
                .accentColor(.pinkAccent)
                .tabItem {
                    Label("Главная", image: "House")
                }
                
                // вторая вкладка таббара
                ZStack {
                    Color.grayLight.edgesIgnoringSafeArea(.top)
                    Text("Приёмы")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .background(Color.white)
                .accentColor(.pinkAccent)
                .tabItem {
                    Label("Приёмы", image: "Calendar")
                }
                
                // третья вкладка таббара
                ZStack {
                    Color.grayLight.edgesIgnoringSafeArea(.top)
                    Text("Чат")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .background(Color.white)
                .accentColor(.pinkAccent)
                .tabItem {
                    Label("Чат", image: "Chat")
                }
                
                // четвертая вкладка таббара
                ZStack {
                    Color.grayLight.edgesIgnoringSafeArea(.top)
                    Text("Профиль")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
                .background(Color.white)
                .accentColor(.pinkAccent)
                .tabItem {
                    Label("Профиль", image: "Profile")
                }
            }
            .frame(maxHeight: .infinity)
        }

        
    }
    
    
    
    
    
}

#Preview {
    ContentView()
}
