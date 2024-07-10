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
    
    let doctorViewModel: DoctorViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                doctorViewModel.sortedDoctors(selectedSort: SortOption.price)
            }) {
                Text("По цене")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 7)
            }
            .background(doctorViewModel.selectedSort == .price ? Color.pinkAccent : Color.white)
            .foregroundColor(doctorViewModel.selectedSort == .price ? Color.white : Color.grayDark)
            
            Button(action: {
                doctorViewModel.sortedDoctors(selectedSort: SortOption.experience)
            }) {
                Text("По стажу")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 7)
            }
            .background(doctorViewModel.selectedSort == .experience ? Color.pinkAccent : Color.white)
            .foregroundColor(doctorViewModel.selectedSort == .experience ? Color.white : Color.grayDark)
            
            Button(action: {
                doctorViewModel.sortedDoctors(selectedSort: SortOption.rating)
            }) {
                Text("По рейтингу")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 7)
            }
            .background(doctorViewModel.selectedSort == .rating ? Color.pinkAccent : Color.white)
            .foregroundColor(doctorViewModel.selectedSort == .rating ? Color.white : Color.grayDark)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
        .padding(.horizontal, 16)
    }
}
