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
    var price: Int
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
                                .lineSpacing(6)
                                .multilineTextAlignment(.leading)
                            RatingView(rating: doctor.rating)
                                .padding(.vertical, 4)
                            Text("Педиатр・стаж \(doctor.experience) лет")
                                .font(.system(size: 14))
                                .foregroundColor(.grayDark)
                                .padding(.vertical, 4)
                            Text("от \(doctor.price) ₽")
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
                // действие при нажатии на кнопку "Записаться"
            }) {
                if doctor.available {
                    Text("Записаться")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.pinkAccent)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                } else {
                    Text("Нет свободного расписания")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.grayBasic)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
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
