//
//  DoctorCard.swift
//  Doc24
//
//  Created by Margarita Pitinova on 08.07.2024.
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

struct DoctorCard: View {
    @State var doctor: Doctor
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                NavigationLink(destination: DoctorDetailView(doctor: doctor)) {
                    HStack(alignment: .top) {
                        
                        Image(doctor.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(doctor.name)
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                            RatingView(rating: doctor.rating)
                                .padding(.vertical, 4)
                            Text("Педиатр・стаж \(doctor.experience) лет")
                                .font(.system(size: 14))
                                .foregroundColor(.grayDark)
                                .padding(.vertical, 4)
                            Text(doctor.price)
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                        }
                    }
                }
                Spacer()
                Button(action: {
                    doctor.isLiked.toggle()
                }) {
                    Image(systemName: doctor.isLiked ? "heart.fill" : "heart")
                        .foregroundColor(doctor.isLiked ? .pinkAccent : .grayDark)
                        .font(.system(size: 24))
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
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .background(Color.white)
        .cornerRadius(8)
    }
}

struct RatingView: View {
    var rating: Int
    
    var body: some View {
        HStack(spacing: 2.4) {
            ForEach(0..<5) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(index < rating ? .pinkAccent : .grayDark)
                    .font(.system(size: 12))
            }
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
