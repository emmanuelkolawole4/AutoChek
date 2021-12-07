//
//  NetworkManager.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 04/12/2021.
//

import UIKit

class NetworkManager {
  
  // MARK: - PROPERTIES
  static let shared = NetworkManager()
  let cache = NSCache<NSString, UIImage>()
  
  // MARK: - INITIALIZERS
  private init() {}
  
  // MARK: - CUSTOM METHODS
  func getPopularCarBrands(completion: @escaping (Result<PopularCarBrand, ACError>) -> Void) {
    let popularBrandsEndpoint = ApiEndpoints.baseURL + "make?popular=true"
    
    fetchData(from: popularBrandsEndpoint, resultType: PopularCarBrand.self) { result in
      completion(result)
    }
  }

  func getCars(pageSize: Int, completion: @escaping (Result<CarData, ACError>) -> Void) {
    let carsEndpoint = ApiEndpoints.baseURL + "car/search?pageSize=\(pageSize)"
    
    fetchData(from: carsEndpoint, resultType: CarData.self) { result in
      completion(result)
    }
  }
  
  func getCarDetails(from carId: String, completion: @escaping (Result<CarDetails, ACError>) -> Void) {
    let carDetailsEndpoint = ApiEndpoints.baseURL + "car/\(carId)"
    
    fetchData(from: carDetailsEndpoint, resultType: CarDetails.self) { result in
      completion(result)
    }
  }
  
  func fetchData<T: Decodable>(from urlString: String, resultType: T.Type, completion: @escaping (Result<T, ACError>) -> Void) {
    guard let url = URL(string: urlString) else {
      completion(.failure(.invalidUrl))
      return
    }
    
    let urlRequest = URLRequest(url: url)
    
    let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      if let _ = error {
        completion(.failure(.unableToComplete))
        return
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completion(.failure(.invalidResponse))
        return
      }
      
      guard let data = data else {
        completion(.failure(.invalidData))
        return
      }

      do {
        let decoder = JSONDecoder()
        let data = try decoder.decode(T.self, from: data)
        completion(.success(data))
      } catch let decodingError {
        dump("error: \(decodingError)")
        completion(.failure(.invalidData))
      }
    }
    task.resume()
  }
}
