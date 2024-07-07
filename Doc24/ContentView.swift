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
    var experience: Int
    var price: String
    var rating: Int
    var isLiked: Bool
    var imageName: String
    var available: Bool
}

enum SortOption {
    case price, experience, rating
}

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
        // первая вкладка таббара
        VStack {
            TabView {
                NavigationView {
                    ZStack {
                        Color.grayLight.edgesIgnoringSafeArea(.top)
                        VStack {
                            ScrollView {
                                // поиск
                                SearchView(searchDoctor: $searchDoctor)
                                
                                // кнопки сортировки
                                SortButtonsView(selectedSort: $selectedSort)
                                
                                VStack(spacing: 16) {
                                    // таблица с врачами
                                    ForEach(filteredDoctors) { doctor in
                                        DoctorCard(doctor: doctor)
                                    }
                                }
//                                .padding(.horizontal, 16)
//                                .padding(.vertical, 8)
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

struct SearchView: View {
    
    @Binding var searchDoctor: String
    
    var body: some View {
        
//        Text("Педиатры")
//            .font(.system(size: 20))
//            .foregroundColor(.black)
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
            .padding(.vertical, 8)
    }
}

struct SortButtonsView: View {
    
    @Binding var selectedSort: SortOption
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                selectedSort = .price
                priceSort()
            }) {
                Text("По цене")
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
        VStack(alignment: .leading, spacing: 8) {
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
                        .fontWeight(.semibold)
                    RatingView(rating: doctor.rating)
                        .padding(.vertical, 4)
                    Text("Педиатр・стаж \(doctor.experience) лет")
                        .font(.system(size: 14))
                        .foregroundColor(.grayDark)
                        .padding(.vertical, 4)
                    Text(doctor.price)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .padding(.vertical, 4)
                        .fontWeight(.semibold)
                }
                Spacer()
                Button(action: {
                    doctor.isLiked.toggle()
                }) {
                    Image(systemName: doctor.isLiked ? "heart.fill" : "heart")
                        .foregroundColor(doctor.isLiked ? .pinkAccent : .grayDark)
                }
            }
            .padding(16)
            
            Button(action: {
                // Действие при нажатии на кнопку "Записаться"
            }) {
                Text("Записаться")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .fontWeight(.semibold)
                    .background(Color.pinkAccent)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(16)
        }
        .background(Color.white)
        .cornerRadius(8)
        .padding(.horizontal, 16)
    }
}

struct RatingView: View {
    var rating: Int
    
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: index < rating ? "star.fill" : "star")
                    .foregroundColor(index < rating ? .pinkAccent : .grayDark)
                    .font(.system(size: 12))
            }
            .padding(1.2)

        }
    }
}




//struct DoctorCardView: View {
//    let doctor: Doctor
//    var action: (Doctor) -> Void
//    
//    var body: some View {
//        Button(action: {
//            action(doctor)
//        }) {
//            VStack(alignment: .leading, spacing: 8) {
//                HStack {
//                    Image(systemName: "person.circle.fill")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .clipShape(Circle())
//                    VStack(alignment: .leading) {
//                        Text(doctor.name)
//                            .font(.headline)
//                        HStack {
//                            ForEach(0..<doctor.rating, id: \.self) { _ in
//                                Image(systemName: "star.fill")
//                                    .foregroundColor(.pink)
//                            }
//                        }
//                        Text("Педиатр - стаж \(doctor.experience) лет")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                    }
//                    Spacer()
//                    Image(systemName: "heart")
//                        .foregroundColor(.gray)
//                }
//                Text("от \(doctor.price) ₽")
//                    .font(.headline)
//                if doctor.available {
//                    Text("Записаться")
//                        .font(.headline)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.pink)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                } else {
//                    Text("Нет свободного расписания")
//                        .font(.headline)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color(.systemGray4))
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                }
//            }
//            .padding()
//            .background(Color.white)
//            .cornerRadius(8)
//        }
//    }
//}



struct DoctorDetailView: View {
    let doctor: Doctor?
    
    var body: some View {
        if let doctor = doctor {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(doctor.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Опыт работы: \(doctor.experience) лет")
                        Text("Врач высшей категории")
                        Text("1-й ММИ им. И.М.Сеченова")
                        Text("Детская клиника \"РебёнОК\"")
                    }
                }
                .padding()
                VStack(alignment: .leading) {
                    Text("Стоимость услуг")
                        .font(.headline)
                    Text("от \(doctor.price) ₽")
                        .font(.title)
                }
                .padding()
                Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Даёт рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                    .padding()
                Spacer()
                Button(action: {
                    // Action for booking
                }) {
                    if doctor.available {
                        Text("Записаться")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding()
                    } else {
                        Text("Нет свободного расписания")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding()
                    }
                }
            }
            .navigationBarTitle("Педиатр", displayMode: .inline)
        } else {
            Text("No doctor selected")
                .navigationBarTitle("Педиатр", displayMode: .inline)
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
