//
//  PopularBrand.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 04/12/2021.
//

import Foundation

struct PopularCarBrand: Codable {
  let makeList: [MakeList]
  let pagination: Pagination
}

struct MakeList: Codable, Hashable {
  let id: Int
  let name: String
  let imageURL: String
  
  enum CodingKeys: String, CodingKey {
    case id, name
    case imageURL = "imageUrl"
  }
}

struct Pagination: Codable {
  let total, currentPage, pageSize: Int
}
