//
//  PriceView.swift
//  Doc24
//
//  Created by Margarita Pitinova on 08.07.2024.
//

import SwiftUI

struct PriceView: View {
    let doctor: Doctor?
    
    var body: some View {
        if let doctor = doctor {
            ZStack {
                Color.grayLight.edgesIgnoringSafeArea(.top)
                VStack(alignment: .leading) {
                    Text("Видеоконсультация")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                    ZStack() {
                        HStack() {
                            Text("30 мин")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                            Spacer()
                            Text(doctor.price) // пофиксить прайс: убрать "от"
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
                    
                    Text("Чат с врачом")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                    ZStack() {
                        HStack() {
                            Text("30 мин")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                            Spacer()
                            Text(doctor.price) // пофиксить прайс: убрать "от"
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
                    
                    Text("Приём в клинике")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                    ZStack() {
                        HStack() {
                            Text("В клинике")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                            Spacer()
                            Text(doctor.price) // пофиксить прайс: убрать "от"
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
                }
            }
        }
    }
}
