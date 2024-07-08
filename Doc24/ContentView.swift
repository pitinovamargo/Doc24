//
//  ContentView.swift
//  Doc24
//
//  Created by Margarita Pitinova on 05.07.2024.
//

import SwiftUI


enum Tab {
    case main, appointments, chat, profile
}


struct ContentView: View {
    
    @State private var searchDoctor = ""
    @State private var selectedSort: SortOption = .price
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTab: Tab = .main
    @State private var doctors: [Doctor] = []
    
    private var doctorService: DoctorService = DoctorService()
    private var filteredDoctors: [Doctor] {
        var result = doctors
        if !searchDoctor.isEmpty {
            result = doctors.filter { $0.lastName.lowercased().contains(searchDoctor.lowercased()) }
        }
        
        switch selectedSort {
        case .price:
            result = result.sorted { $0.hospitalPrice < $1.hospitalPrice }
        case .experience:
            result = result.sorted { $0.seniority > $1.seniority }
        case .rating:
            result = result.sorted { $0.ratingsRating > $1.ratingsRating }
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
                                
                                // карточки с врачами
                                if doctors.isEmpty {
                                    Text("Loading...") // добавить ProgressHud
                                }
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
                    .onAppear {
                        doctorService.fetchDoctors { fetchedDoctors in
                            doctors = fetchedDoctors
                        }
                    }
                    .navigationBarTitle("Педиатры", displayMode: .inline)
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Педиатры")
                                .font(.system(size: 20))
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.grayDark)
                            }
                        }
                    }
                }
                .background(Color.white)
                .tabItem {
                    VStack {
                        Image("House")
                            .renderingMode(.template)
                        Text("Главная")
                    }
                }
                .tag(Tab.main)
                
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
                    VStack {
                        Image("Calendar")
                            .renderingMode(.template)
                        Text("Приёмы")
                    }
                }
                .tag(Tab.appointments)
                
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
                    VStack {
                        Image("Chat")
                            .renderingMode(.template)
                        Text("Чат")
                    }
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
                    VStack {
                        Image("Profile")
                            .renderingMode(.template)
                        Text("Профиль")
                    }
                }
            }
            .frame(maxHeight: .infinity)
            .accentColor(.pinkAccent)
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
