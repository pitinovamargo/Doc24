//
//  Doctor.swift
//  Doc24
//
//  Created by Margarita Pitinova on 10.07.2024.
//

import Foundation

struct Doctor: Codable, Identifiable {
    let id: String
    let firstName: String
    let patronymic: String
    let lastName: String
    let specialization: [Specialization]
    let ratingsRating: Double
    let seniority: Int
    let textChatPrice: Int
    let videoChatPrice: Int
    let homePrice: Int
    let hospitalPrice: Int
    let avatar: String?
    let educationTypeLabel: EducationLabel?
    let categoryLabel: String
    let workExpirience: [WorkExpirience]
    let freeReceptionTime: [FreeReceptionTime]
    var isFavorite: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case patronymic, lastName = "last_name"
        case specialization, ratingsRating = "ratings_rating"
        case seniority, textChatPrice = "text_chat_price"
        case videoChatPrice = "video_chat_price"
        case homePrice = "home_price"
        case hospitalPrice = "hospital_price"
        case avatar
        case educationTypeLabel = "education_type_label"
        case categoryLabel = "category_label"
        case workExpirience = "work_expirience"
        case freeReceptionTime = "free_reception_time"
        case isFavorite = "is_favorite"
    }
}

struct Specialization: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}

struct EducationLabel: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}

struct WorkExpirience: Codable {
    let id: Int
    let organization: String
    
    enum CodingKeys: String, CodingKey {
        case id, organization
    }
}

struct FreeReceptionTime: Codable {
    let time: Int
    
    enum CodingKeys: String, CodingKey {
        case time
    }
}
