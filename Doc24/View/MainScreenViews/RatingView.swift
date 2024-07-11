//
//  RatingView.swift
//  Doc24
//
//  Created by Margarita Pitinova on 11.07.2024.
//

import SwiftUI

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
