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
  
}

enum Home {
  
  enum Images {
    
    static let grid = UIImage(systemName: "square.grid.2x2.fill", withConfiguration:UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(UIColor(red: (15/255), green: (19/255), blue: (39/255), alpha: 1), renderingMode: .alwaysOriginal)
    static let cart = UIImage(named: "cart")
    static let search = UIImage(named: "search")
    static let filter = UIImage(systemName: "slider.horizontal.3", withConfiguration:UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(UIColor(red: (255/255), green: (204/255), blue: (102/255), alpha: 1), renderingMode: .alwaysOriginal)
    
  }
}
