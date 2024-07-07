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
                    VStack {
                        Text("Педиатры")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        TextField("Поиск", text: $searchDoctor)
                                        .padding(9)
                                        .padding(.horizontal, 25)
                                        .background(Color(.white))
                                        .overlay(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color.grayBasic, style: StrokeStyle(lineWidth: 1.0)))
                                        .overlay(
                                            HStack {
                                                Image(systemName: "magnifyingglass")
                                                    .foregroundColor(.silver)
                                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                                    .padding(.leading, 8)

                                                if !searchDoctor.isEmpty {
                                                    Button(action: {
                                                        self.searchDoctor = ""
                                                    }) {
                                                        Image(systemName: "multiply.circle.fill")
                                                            .foregroundColor(.grayBasic)
                                                            .padding(.trailing, 8)
                                                    }
                                                }
                                            }
                                        )
                                        .cornerRadius(8)
                                        .padding(.horizontal, 10)

                        HStack {
                            Button(action: priceSort) {
                                Text("По цене ↓")
                            }
                            .padding()
                            .tint(.pinkAccent)
                            Button(action: experienceSort) {
                                Text("По стажу")
                            }
                            .padding()
                            .tint(.pinkAccent)
                            Button(action: ratingSort) {
                                Text("По рейтингу")
                            }
                            .padding()
                            .tint(.pinkAccent)
                        }
                    }
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
    
    
    private func priceSort() {
        //TODO: priceSort
    }
    private func experienceSort() {
        //TODO: experienceSort
    }
    private func ratingSort() {
        //TODO: ratingSort
    }
    
    
}

#Preview {
    ContentView()
}
