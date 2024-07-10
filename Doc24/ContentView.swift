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
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTab: Tab = .main
    private var doctorService: DoctorService = DoctorService()
    @StateObject private var doctorViewModel = DoctorViewModel()
    
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
                                SearchView(doctorViewModel: doctorViewModel)
                                
                                // кнопки сортировки
                                SortButtonsView(doctorViewModel: doctorViewModel)

                                // карточки с врачами
                                if doctorViewModel.doctors.isEmpty {
                                    Text("Loading...") // добавить ProgressHud
                                }
                                VStack(spacing: 16) {
                                    ForEach(doctorViewModel.doctors) { doctor in
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
                            doctorViewModel.doctors = fetchedDoctors
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
