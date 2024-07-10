//
//  DoctorViewModel.swift
//  Doc24
//
//  Created by Margarita Pitinova on 10.07.2024.
//

import SwiftUI

class DoctorViewModel: ObservableObject {
    @Published var doctors: [Doctor] = []
    private var doctorService = DoctorService()
    @Published var selectedSort: SortOption = .price
    @Published var searchDoctor: String = "" {
            didSet {
                filterDoctors()
            }
        }
    
    init() {
        fetchDoctors()
    }
    
    func filterDoctors() {
        var result = doctors
        if !searchDoctor.isEmpty {
            result = doctors.filter { $0.lastName.lowercased().contains(searchDoctor.lowercased()) }
        }
        doctors = result
    }
    
    func sortedDoctors(selectedSort: SortOption) {
        self.selectedSort = selectedSort
        switch selectedSort {
        case .experience:
            doctors = doctors.sorted { $0.seniority > $1.seniority }
        case .rating:
            doctors = doctors.sorted { $0.ratingsRating > $1.ratingsRating }
        default:
            doctors = doctors.sorted { $0.hospitalPrice < $1.hospitalPrice }
        }
    }
    
    func fetchDoctors() {
        doctorService.fetchDoctors { [weak self] doctors in
            DispatchQueue.main.async {
                self?.doctors = doctors
            }
        }
    }
    
}
