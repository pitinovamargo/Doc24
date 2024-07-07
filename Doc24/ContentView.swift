//
//  ContentView.swift
//  Doc24
//
//  Created by Margarita Pitinova on 05.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchDoctor = ""
    
    @State private var selectedSort: SortOption = .none
    
    enum SortOption {
        case none, price, experience, rating
    }
    
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
                            .padding(.horizontal, 16)
                        
                        HStack(spacing: 0) {
                            Button(action: {
                                selectedSort = .price
                                priceSort()
                            }) {
                                Text("По цене ↓")
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 7)
                            }
                            .background(selectedSort == .price ? Color.pinkAccent : Color.white)
                            .foregroundColor(selectedSort == .price ? Color.white : Color.grayDark)
                            
                            Button(action: {
                                selectedSort = .experience
                                experienceSort()
                            }) {
                                Text("По стажу")
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 7)
                            }
                            .background(selectedSort == .experience ? Color.pinkAccent : Color.white)
                            .foregroundColor(selectedSort == .experience ? Color.white : Color.grayDark)
                            
                            Button(action: {
                                selectedSort = .rating
                                ratingSort()
                            }) {
                                Text("По рейтингу")
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 7)
                            }
                            .background(selectedSort == .rating ? Color.pinkAccent : Color.white)
                            .foregroundColor(selectedSort == .rating ? Color.white : Color.grayDark)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                        .padding(.horizontal, 16)

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
