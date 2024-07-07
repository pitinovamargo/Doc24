//
//  ContentView.swift
//  Doc24
//
//  Created by Margarita Pitinova on 05.07.2024.
//

import SwiftUI

struct Doctor: Identifiable {
    var id = UUID()
    var name: String
    var experience: String
    var price: String
    var rating: Int
    var isLiked: Bool
    var imageName: String
}

struct ContentView: View {
    
    @State private var searchDoctor = ""
    
    @State private var selectedSort: SortOption = .none
    
    enum SortOption {
        case none, price, experience, rating
    }
    
    @State private var doctors: [Doctor] = [
            Doctor(name: "Семенова Дарья Сергеевна", experience: "Педиатр・стаж 27 лет", price: "от 600 ₽", rating: 5, isLiked: false, imageName: "Photo1"),
            Doctor(name: "Бардо Кристина Алексеевна", experience: "Педиатр・стаж 10 лет", price: "от 600 ₽", rating: 4, isLiked: true, imageName: "Photo2")
        ]
    
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
                        
                        // кнопки сортировки
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
                        
                        // таблица с врачами
                        List(doctors) { doctor in
                                    DoctorCard(doctor: doctor)
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

struct DoctorCard: View {
    @State var doctor: Doctor
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top) {
                Image(doctor.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())

                VStack(alignment: .leading) {
                    Text(doctor.name)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    RatingView(rating: doctor.rating)
                    Text(doctor.experience)
                        .font(.system(size: 14))
                        .foregroundColor(.grayDark)
                    Text(doctor.price)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                }
                Spacer()
                Button(action: {
                    doctor.isLiked.toggle()
                }) {
                    Image(systemName: doctor.isLiked ? "heart.fill" : "heart")
                        .foregroundColor(doctor.isLiked ? .pinkAccent : .grayDark)
                }
            }
            
            Button(action: {
                // Действие при нажатии на кнопку "Записаться"
            }) {
                Text("Записаться")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color.pinkAccent)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .padding(.vertical, 5)
    }
}

struct RatingView: View {
    var rating: Int
    
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: index < rating ? "star.fill" : "star")
                    .foregroundColor(index < rating ? .pinkAccent : .grayDark)
            }
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
