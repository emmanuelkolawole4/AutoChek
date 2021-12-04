//
//  NetworkManager.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 04/12/2021.
//

import Foundation

class NetworkManager {
  
  // MARK: - PROPERTIES
  static let shared = NetworkManager()
  
  // MARK: - INITIALIZERS
  private init() {}
  
  // MARK: - CUSTOM METHODS
  func getPopularCarBrands(completion: @escaping (Result<PopularBrand, ACError>) -> Void) {
    let popularBrandsEndpoint = ApiEndpoints.baseURL + "make?popular=true"
    guard let url = URL(string: popularBrandsEndpoint) else {
      completion(.failure(.invalidUrl))
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let _ = error {
        dump("error: \(error)")
        completion(.failure(.unableToComplete))
        return
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        dump("response: \(response)")
        completion(.failure(.invalidResponse))
        return
      }
      
      guard let data = data else {
        dump("data: \(data)")
        completion(.failure(.invalidData))
        return
      }
      
      do {
        let decoder = JSONDecoder()
        let popularCarBrands = try decoder.decode(PopularBrand.self, from: data)
        dump("popularCarBrands: \(popularCarBrands)")
        completion(.success(popularCarBrands))
      } catch let decodingError {
        dump("error: \(decodingError)")
        completion(.failure(.invalidData))
      }
    }
    task.resume()
  }
}
