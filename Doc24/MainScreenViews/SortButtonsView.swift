//
//  SortButtonsView.swift
//  Doc24
//
//  Created by Margarita Pitinova on 08.07.2024.
//

import SwiftUI

enum SortOption {
    case price, experience, rating
}

struct SortButtonsView: View {
    
    @Binding var selectedSort: SortOption
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                selectedSort = .price
            }) {
                Text("По цене")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 7)
            }
            .background(selectedSort == .price ? Color.pinkAccent : Color.white)
            .foregroundColor(selectedSort == .price ? Color.white : Color.grayDark)
            
            Button(action: {
                selectedSort = .experience
            }) {
                Text("По стажу")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 7)
            }
            .background(selectedSort == .experience ? Color.pinkAccent : Color.white)
            .foregroundColor(selectedSort == .experience ? Color.white : Color.grayDark)
            
            Button(action: {
                selectedSort = .rating
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
}
