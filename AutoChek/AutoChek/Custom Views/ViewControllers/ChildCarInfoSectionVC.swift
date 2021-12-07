//
//  CarMiniInfoVC.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 07/12/2021.
//

import UIKit

class ChildCarInfoSectionVC: ParentCarInfoSectionVC {
  
  // MARK: - PROPERTIES
  
  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureItems()
  }
  
  // MARK: - CUSTOM METHODS
  private func configureItems() {
    itemInfoViewOne.setupUIElements(for: .location, with: carDetails)
    itemInfoViewTwo.setupUIElements(for: .price, with: carDetails)
    actionButton.set(backgroundColor: .systemPurple, title: "")
  }
  
}
