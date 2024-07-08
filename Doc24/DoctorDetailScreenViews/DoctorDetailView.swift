//
//  DoctorDetailView.swift
//  Doc24
//
//  Created by Margarita Pitinova on 08.07.2024.
//

import SwiftUI

struct DoctorDetailView: View {
    let doctor: Doctor?
    
    var body: some View {
        if let doctor = doctor {
            ZStack {
                Color.grayLight.edgesIgnoringSafeArea(.top)
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Image(doctor.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                        Text(doctor.name)
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
                            Text("Опыт работы: \(doctor.experience) лет")
                                .font(.system(size: 14))
                                .foregroundColor(.grayDark)
                                .padding(.vertical, 4)
                        }
                        HStack() {
                            Image("FirstAidKit")
                                .frame(width: 24,height: 24)
                                .foregroundColor(.grayDark)
                            Text("Врач высшей категории")
                                .font(.system(size: 14))
                                .foregroundColor(.grayDark)
                                .padding(.vertical, 4)
                        }
                        HStack() {
                            Image("Graduation")
                                .frame(width: 24,height: 24)
                                .foregroundColor(.grayDark)
                            Text("1-й ММИ им. И.М.Сеченова")
                                .font(.system(size: 14))
                                .foregroundColor(.grayDark)
                                .padding(.vertical, 4)
                        }
                        HStack() {
                            Image("Position")
                                .frame(width: 24,height: 24)
                                .foregroundColor(.grayDark)
                            Text("Детская клиника \"РебёнОК\"")
                                .font(.system(size: 14))
                                .foregroundColor(.grayDark)
                                .padding(.vertical, 4)
                        }
                    }
                    .padding()
                    Button(action: {
                        
                    }) {
                        HStack() {
                            Text("Стоимость услуг")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                            Spacer()
                            Text(doctor.price)
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 18)
                    }
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color.grayBasic, style: StrokeStyle(lineWidth: 1.0)))
                    .padding(.horizontal, 16)
                    Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Даёт рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                        .padding()
                        .font(.system(size: 14))
                        .lineSpacing(8)
                    Spacer()
                    Button(action: {
                        // действие для брони места
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
                    .padding(.bottom, 10)
                }
            }
            .navigationBarTitle("Педиатр", displayMode: .inline)
        } else {
            Text("No doctor selected")
                .navigationBarTitle("Педиатр", displayMode: .inline)
        }
    }
}
