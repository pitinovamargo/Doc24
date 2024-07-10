//
//  DoctorCard.swift
//  Doc24
//
//  Created by Margarita Pitinova on 08.07.2024.
//

import SwiftUI
import Kingfisher

struct DoctorCard: View {
    @State var doctor: Doctor
    var lowestPrice: Int {
        [doctor.hospitalPrice, doctor.homePrice, doctor.textChatPrice, doctor.videoChatPrice].min() ?? 0
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                NavigationLink(destination: DoctorDetailView(doctor: doctor)) {
                    HStack(alignment: .top) {
                        
                        // использую Kingfisher для загрузки изображений
                        if let avatarUrl = URL(string: doctor.avatar ?? "") {
                            KFImage(avatarUrl)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        } else {
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 50, height: 50)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("\(doctor.lastName)\n\(doctor.firstName) \(doctor.patronymic)")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .lineSpacing(6)
                                .multilineTextAlignment(.leading)
                            RatingView(rating: Int(doctor.ratingsRating))
                                .padding(.vertical, 4)
                            Text("\(doctor.specialization.first?.name ?? "Педиатр") ・ стаж \(doctor.seniority) лет")
                                .font(.system(size: 14))
                                .foregroundColor(.grayDark)
                                .padding(.vertical, 4)
                            Text("от \(lowestPrice) ₽")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                        }
                    }
                }
                Spacer()
                Button(action: {
                    doctor.isFavorite.toggle()
                }) {
                    Image(systemName: doctor.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(doctor.isFavorite ? .pinkAccent : .grayDark)
                        .font(.system(size: 24))
                }
            }
            .padding(16)
            
            Button(action: {
                // действие при нажатии на кнопку "Записаться"
            }) {
                if !doctor.freeReceptionTime.isEmpty {
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
