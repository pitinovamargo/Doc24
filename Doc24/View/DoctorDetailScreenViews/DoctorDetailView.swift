//
//  DoctorDetailView.swift
//  Doc24
//
//  Created by Margarita Pitinova on 08.07.2024.
//

import SwiftUI
import Kingfisher

struct DoctorDetailView: View {
    @ObservedObject var viewModel: DoctorCardViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.grayLight.edgesIgnoringSafeArea(.top)
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    if let avatarUrl = URL(string: viewModel.avatar()) {
                        KFImage(avatarUrl)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                    } else {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .background(Circle().fill(Color.grayBackground))
                            .foregroundColor(.grayLight)
                            .clipShape(Circle())
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                    }
                    Text(viewModel.fullName())
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(6)
                        .padding(.top, 16)
                }
                VStack(alignment: .leading) {
                    HStack() {
                        Image("Timeout")
                            .frame(width: 24,height: 24)
                            .foregroundColor(.grayDark)
                        Text(viewModel.seniority())
                            .font(.system(size: 14))
                            .foregroundColor(.grayDark)
                            .padding(.vertical, 4)
                    }
                    HStack() {
                        Image("FirstAidKit")
                            .frame(width: 24,height: 24)
                            .foregroundColor(.grayDark)
                        Text(viewModel.category())
                            .font(.system(size: 14))
                            .foregroundColor(.grayDark)
                            .padding(.vertical, 4)
                    }
                    HStack() {
                        Image("Graduation")
                            .frame(width: 24,height: 24)
                            .foregroundColor(.grayDark)
                        Text(viewModel.education())
                            .font(.system(size: 14))
                            .foregroundColor(.grayDark)
                            .padding(.vertical, 4)
                    }
                    HStack() {
                        Image("Position")
                            .frame(width: 24,height: 24)
                            .foregroundColor(.grayDark)
                        Text(viewModel.organization())
                            .font(.system(size: 14))
                            .foregroundColor(.grayDark)
                            .padding(.vertical, 4)
                    }
                }
                .padding()
                VStack {
                    NavigationLink(destination: PriceView(viewModel: viewModel)) {
                        HStack {
                            Text("Стоимость услуг")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                            Spacer()
                            Text(viewModel.price())
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 18)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color.grayBasic, style: StrokeStyle(lineWidth: 1.0)))
                        .padding(.horizontal, 16)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Даёт рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                    .padding()
                    .font(.system(size: 14))
                    .lineSpacing(8)
                Spacer()
                Button(action: {
                    // действие для записи к врачу
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
                .padding(.bottom, 10)
            }
        }
        .navigationBarTitle("Педиатр", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Педиатр")
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
}
