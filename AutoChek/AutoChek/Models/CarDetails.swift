//
//  CarDetails.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 06/12/2021.
//

import Foundation

struct CarDetails: Codable {
  let id: String
  let year: Int
  let insured: Bool
  let mileage: Int
  let vin: String
  let marketplacePrice: Int
  let isFeatured: Bool
  let imageURL: String?
//  let model: Model
  let state, country, transmission: String
  let fuelType, sellingCondition: String
  let bodyType: BodyType
  let city: String
  let marketplaceOldPrice: Int
  let mileageUnit: String
  let hasWarranty, hasFinancing: Bool
  let interiorColor, exteriorColor, engineType: String
  let installment: Int
  let depositReceived: Bool
  let loanValue: Int
  let websiteURL: String
  let sold: Bool
  let carName: String
//  let financingSettings: FinancingSettings
  
  enum CodingKeys: String, CodingKey {
    case id, year, insured, mileage, vin, marketplacePrice, isFeatured
    case imageURL = "imageUrl"
    case state, country, transmission, fuelType, sellingCondition, bodyType, city, marketplaceOldPrice, mileageUnit, hasWarranty, hasFinancing, interiorColor, exteriorColor, engineType, installment, depositReceived, loanValue
    case websiteURL = "websiteUrl"
    case sold, carName
  }
}

struct BodyType: Codable {
  let id: Int
  let name: String
  let imageURL: String
  
  enum CodingKeys: String, CodingKey {
    case id, name
    case imageURL = "imageUrl"
  }
}

// MARK: - FinancingSettings
//struct FinancingSettings: Codable {
//  let loanCalculator: LoanCalculator
//}

// MARK: - LoanCalculator
//struct LoanCalculator: Codable {
//  let loanPercentage: Double
//  let ranges: Ranges
//  let defaultValues: DefaultValues
//}

// MARK: - DefaultValues
//struct DefaultValues: Codable {
//  let interestRate, downPayment: Double
//  let tenure: Int
//}

// MARK: - Ranges
//struct Ranges: Codable {
//  let minInterestRate, maxInterestRate, minDownPayment, maxDownPayment: Double
//  let tenure: Int
//}

// MARK: - Model
//struct Model: Codable {
//  let id: Int
//  let name, wheelType: String
//  let imageURL: String?
//  let make: BodyType
//  let popular: Bool
//
//  enum CodingKeys: String, CodingKey {
//    case id, name
//    case imageURL = "imageUrl"
//    case wheelType, make, popular
//  }
//}
