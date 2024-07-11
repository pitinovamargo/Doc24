//
//  DoctorListViewModel.swift
//  Doc24
//
//  Created by Margarita Pitinova on 10.07.2024.
//

import SwiftUI

final class DoctorListViewModel: ObservableObject {
    private var doctors: [Doctor] = []
    private var sortedFilteredDoctors: [Doctor] = []
    private var doctorService = DoctorService()
    @Published var currentDoctorsState: [Doctor] = []
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
        var filtered = doctors
        if searchDoctor.isEmpty {
            filtered = doctors
        } else {
            filtered = doctors.filter { $0.lastName.lowercased().contains(searchDoctor.lowercased()) }
        }
        sortState(filtered)
    }
    
    func sortedDoctors(selectedSort: SortOption) {
        self.selectedSort = selectedSort
        sortState(currentDoctorsState)
    }
    
    func sortState(_ doctors: [Doctor]) {
        let sorted: [Doctor]
        switch selectedSort {
        case .experience:
            sorted = doctors.sorted { $0.seniority > $1.seniority }
        case .rating:
            sorted = doctors.sorted { $0.ratingsRating > $1.ratingsRating }
        default:
            sorted = doctors.sorted { $0.hospitalPrice < $1.hospitalPrice }
        }
        currentDoctorsState = sorted
    }
    
    func fetchDoctors() {
        doctorService.fetchDoctors { [weak self] doctors in
            DispatchQueue.main.async {
                self?.doctors = doctors
                self?.currentDoctorsState = doctors
            }
        }
    }
}
