//
//  DoctorService.swift
//  Doc24
//
//  Created by Margarita Pitinova on 09.07.2024.
//

import Foundation

final class DoctorService {
    func fetchDoctors(completion: @escaping ([Doctor]) -> Void) {
        guard let url = URL(string: "https://api.jsonbin.io/v3/b/655b754e0574da7622c94aa4") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let response = try JSONDecoder().decode(DoctorsResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(response.record.data.users)
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        
        task.resume()
    }
}

struct DoctorsResponse: Codable {
    let record: DoctorRecord
    
    struct DoctorRecord: Codable {
        let data: Data
        
        struct Data: Codable {
            let users: [Doctor]
        }
    }
}
