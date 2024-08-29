//
//  NetworkService.swift
//  SuGitti-VIPER
//
//  Created by Ozan Çiçek on 29.08.2024.
//


import Foundation
import SVProgressHUD

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(String)
}

class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchWaterCuts(completion: @escaping (Result<[WaterCut], NetworkError>) -> Void) {
        
        let urlString = "https://openapi.izmir.bel.tr/api/izsu/arizakaynaklisukesintileri"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.serverError(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let waterCuts = try JSONDecoder().decode([WaterCut].self, from: data)
                completion(.success(waterCuts))
            } catch {
                completion(.failure(.decodingError))
                
            }
        }.resume()
    }
}
