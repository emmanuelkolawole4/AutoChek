//
//  CarData.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 06/12/2021.
//

import Foundation

// MARK: - CarData
struct CarData: Codable {
  let result: [Car]
  let pagination: Pagination
}

// MARK: - Pagination
struct Paginable: Codable {
  let total, currentPage, pageSize: Int
}

// MARK: - Result
struct Car: Codable, Hashable {
  let id: String
  let title: String
  let imageURL: String
  let year: Int
  let city, state: String
  let sellingCondition: SellingCondition
  let hasWarranty: Bool
  let marketplacePrice, marketplaceOldPrice: Int
  let hasFinancing: Bool
  let mileage: Int
  let mileageUnit: MileageUnit
  let installment: Int
  let depositReceived: Bool
  let loanValue: Int
  let websiteURL: String
//  let stats: Stats
  let bodyTypeID: String
  let sold, hasThreeDImage: Bool
  let gradeScore: Double?
  
  enum CodingKeys: String, CodingKey {
    case id, title
    case imageURL = "imageUrl"
    case year, city, state, sellingCondition, hasWarranty, marketplacePrice, marketplaceOldPrice, hasFinancing, mileage, mileageUnit, installment, depositReceived, loanValue
    case websiteURL = "websiteUrl"
//    case stats
    case bodyTypeID = "bodyTypeId"
    case sold, hasThreeDImage, gradeScore
  }
}

enum MileageUnit: String, Codable {
  case km = "km"
  case miles = "miles"
}

enum SellingCondition: String, Codable {
  case local = "local"
  case new = "new"
}

// MARK: - Stats
struct Stats: Codable {
  let webViewCount, webViewerCount, interestCount, testDriveCount: Int
  let appViewCount, appViewerCount, processedLoanCount: Int
}
