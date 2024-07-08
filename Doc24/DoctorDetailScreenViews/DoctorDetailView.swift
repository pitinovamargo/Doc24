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
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top) {
                    Image(doctor.imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(doctor.name)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text("Опыт работы: \(doctor.experience) лет")
                            .font(.system(size: 14))
                            .foregroundColor(.grayDark)
                            .padding(.vertical, 4)
                        Text("Врач высшей категории")
                            .font(.system(size: 14))
                            .foregroundColor(.grayDark)
                            .padding(.vertical, 4)
                        Text("1-й ММИ им. И.М.Сеченова")
                            .font(.system(size: 14))
                            .foregroundColor(.grayDark)
                            .padding(.vertical, 4)
                        Text("Детская клиника \"РебёнОК\"")
                            .font(.system(size: 14))
                            .foregroundColor(.grayDark)
                            .padding(.vertical, 4)
                    }
                }
                .padding()
                VStack(alignment: .leading) {
                    Text("Стоимость услуг")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                    Text("от \(doctor.price) ₽")
                        .font(.title)
                }
                .padding()
                Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Даёт рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                    .padding()
                Spacer()
                Button(action: {
                    // действие для брони места
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
