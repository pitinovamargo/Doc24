//
//  SearchView.swift
//  Doc24
//
//  Created by Margarita Pitinova on 08.07.2024.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchDoctor: String
    
    var body: some View {

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
