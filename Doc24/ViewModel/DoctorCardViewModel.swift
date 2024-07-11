//
//  DoctorCardViewModel.swift
//  Doc24
//
//  Created by Margarita Pitinova on 10.07.2024.
//

import SwiftUI

final class DoctorCardViewModel: ObservableObject {
    @Published var doctor: Doctor
    var lowestPrice: Int {
        [doctor.hospitalPrice, doctor.homePrice, doctor.textChatPrice, doctor.videoChatPrice].min() ?? 0
    }
    
    init(doctor: Doctor) {
        self.doctor = doctor
    }
    
    func toggleFavorite() {
        doctor.isFavorite.toggle()
    }
    
    func fullName() -> String {
        return "\(doctor.lastName)\n\(doctor.firstName) \(doctor.patronymic)"
    }
    
    func rating() -> Int {
        return Int(doctor.ratingsRating)
    }
    
    func specialization() -> String {
        return "\(doctor.specialization.first?.name ?? "Педиатр") ・ стаж \(doctor.seniority) лет"
    }
    
    func price() -> String {
        return "от \(lowestPrice) ₽"
    }
    
    func chatPrice() -> String {
        return "\(doctor.textChatPrice) ₽"
    }
    
    func videoPrice() -> String {
        return "\(doctor.videoChatPrice) ₽"
    }
    
    func hospitalPrice() -> String {
        return "\(doctor.hospitalPrice) ₽"
    }
    
    func isFavorite() -> Bool {
        return doctor.isFavorite
    }
    
    func hasFreeTime() -> Bool {
        return !doctor.freeReceptionTime.isEmpty
    }
    
    func avatar() -> String {
        return doctor.avatar ?? ""
    }
    
    func seniority() -> String {
        return "Опыт работы: \(doctor.seniority) лет"
    }
    
    func category() -> String {
        if doctor.categoryLabel != "нет" {
            let result: String
            switch doctor.categoryLabel.lowercased() {
            case "высшая":
                result = "высшей"
            case "вторая":
                result = "второй"
            default:
                result = "первой"
            }
            return "Врач \(result) категории"
        } else {
            return "Врач"
        }
    }
    
    func education() -> String {
        return doctor.educationTypeLabel?.name ?? "1-й ММИ им. И.М.Сеченова"
    }
    
    func organization() -> String {
        return doctor.workExpirience
            .sorted { $0.id > $1.id }
            .first?
            .organization ?? "Детская клиника \"РебёнОК\""
    }
}
