//
//  ContentView.swift
//  Doc24
//
//  Created by Margarita Pitinova on 05.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchDoctor = ""
    @State private var selectedSort: SortOption = .price
    
    private var doctors: [Doctor] = [
        Doctor(name: "Семенова\nДарья Сергеевна", experience: 27, price: "от 600 ₽", rating: 5, isLiked: false, imageName: "Photo1", available: true),
        Doctor(name: "Бардо\nКристина Алексеевна", experience: 10, price: "от 700 ₽", rating: 4, isLiked: true, imageName: "Photo2", available: false),
        Doctor(name: "Осташков\nКирилл Вячеславович", experience: 9, price: "от 400 ₽", rating: 5, isLiked: false, imageName: "Photo3", available: true),
        Doctor(name: "Бардо\nКристина Алексеевна", experience: 2, price: "от 800 ₽", rating: 1, isLiked: true, imageName: "Photo2", available: true)
    ]
    
    private var filteredDoctors: [Doctor] {
        var result = doctors
        
        if !searchDoctor.isEmpty {
            result = doctors.filter { $0.name.lowercased().contains(searchDoctor.lowercased()) }
        }
        
        switch selectedSort {
        case .price:
            result = result.sorted { $0.price < $1.price }
        case .experience:
            result = result.sorted { $0.experience > $1.experience }
        case .rating:
            result = result.sorted { $0.rating > $1.rating }
        }
        
        return result
    }
    
    var body: some View {
        // первая вкладка таббара "Главная"
        VStack {
            TabView {
                NavigationStack {
                    ZStack {
                        Color.grayLight.edgesIgnoringSafeArea(.top)
                        VStack {
                            ScrollView {
                                // поисковая строка
                                SearchView(searchDoctor: $searchDoctor)
                                
                                // кнопки сортировки
                                SortButtonsView(selectedSort: $selectedSort)
                                
                                // таблица с врачами
                                VStack(spacing: 16) {
                                    ForEach(filteredDoctors) { doctor in
                                        DoctorCard(doctor: doctor)
                                            .overlay(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color.grayBasic, style: StrokeStyle(lineWidth: 1.0)))
                                            .padding(.horizontal, 16)
                                    }
                                }
                                .padding(.top, 16)
                            }
                        }
                    }
                    .navigationBarTitle("Педиатры", displayMode: .inline)
                }
                .background(Color.white)
                .accentColor(.pinkAccent)
                .tabItem {
                    Label("Главная", image: "House")
                }
                
                // вторая вкладка таббара "Приемы"
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
                
                // третья вкладка таббара "Чат"
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
                
                // четвертая вкладка таббара "Профиль"
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
