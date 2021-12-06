//
//  StringConstants.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 03/12/2021.
//

import Foundation
import UIKit

enum Images {
  
  static let home = UIImage(named: "home")
  static let favorites = UIImage(named: "favorites")
  static let bell = UIImage(named: "bell")
  static let messages = UIImage(systemName: "message.fill", withConfiguration:UIImage.SymbolConfiguration(weight: .regular))
  static let placeholderImage = UIImage(systemName: "ellipsis", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
  static let plus = UIImage(systemName: "plus", withConfiguration:UIImage.SymbolConfiguration(weight: .heavy))?.withTintColor(UIColor(red: (255/255), green: (204/255), blue: (102/255), alpha: 1), renderingMode: .alwaysOriginal)
}

enum Colors {
  static let transparentBlack = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
}

enum Home {
  
  enum Images {
    
    static let grid = UIImage(systemName: "square.grid.2x2.fill", withConfiguration:UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(UIColor(red: (15/255), green: (19/255), blue: (39/255), alpha: 1), renderingMode: .alwaysOriginal)
    static let cart = UIImage(named: "cart")
    static let search = UIImage(named: "search")
    static let filter = UIImage(systemName: "slider.horizontal.3", withConfiguration:UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(UIColor(red: (255/255), green: (204/255), blue: (102/255), alpha: 1), renderingMode: .alwaysOriginal)
    
  }
}

enum ApiEndpoints {
  static let baseURL = "https://api.staging.myautochek.com/v1/inventory/"
}

enum ACError: String, Error {
  case invalidUrl = "This url created an invalid request. Please try again."
  case unableToComplete = "Unable to complete request and load data. Please check your internet connection."
  case invalidResponse = "Invalid response from the server. Please try again."
  case invalidData = "The data received from the server was invalid. Please try again."
}
