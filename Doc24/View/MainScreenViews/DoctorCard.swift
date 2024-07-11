//
//  DoctorCard.swift
//  Doc24
//
//  Created by Margarita Pitinova on 08.07.2024.
//

import SwiftUI
import Kingfisher

struct DoctorCard: View {
    @ObservedObject var viewModel: DoctorCardViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                NavigationLink(destination: DoctorDetailView(viewModel: self.viewModel)) {
                    HStack(alignment: .top) {
                        // использую Kingfisher для загрузки изображений
                        if let avatarUrl = URL(string: viewModel.avatar()) {
                            KFImage(avatarUrl)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .background(Circle().fill(Color.grayBackground))
                                .foregroundColor(.grayLight)
                                .clipShape(Circle())
                        }
                        VStack(alignment: .leading) {
                            Text(viewModel.fullName())
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .lineSpacing(6)
                                .multilineTextAlignment(.leading)
                            RatingView(rating: viewModel.rating())
                                .padding(.vertical, 4)
                            Text(viewModel.specialization())
                                .font(.system(size: 14))
                                .foregroundColor(.grayDark)
                                .padding(.vertical, 4)
                            Text(viewModel.price())
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                        }
                    }
                }
                Spacer()
                Button(action: {
                    viewModel.toggleFavorite()
                }) {
                    Image(systemName: viewModel.isFavorite() ? "heart.fill" : "heart")
                        .foregroundColor(viewModel.isFavorite() ? .pinkAccent : .grayDark)
                        .font(.system(size: 24))
                }
            }
            .padding(16)
            
            Button(action: {
                // действие по нажатию на кнопку "Записаться"
            }) {
                if viewModel.hasFreeTime() {
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
