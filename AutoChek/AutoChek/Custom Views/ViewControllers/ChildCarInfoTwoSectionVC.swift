//
//  CarInfoTwoContainerVC.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 07/12/2021.
//

import UIKit

class ChildCarInfoTwoSectionVC: ParentCarInfoSectionVC {
  
  // MARK: - PROPERTIES
  
  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureItems()
  }
  
  // MARK: - CUSTOM METHODS
  private func configureItems() {
    itemInfoViewOne.setupUIElements(for: .fuelType, with: carDetails)
    itemInfoViewTwo.setupUIElements(for: .engine, with: carDetails)
    actionButton.set(backgroundColor: .systemGreen, title: "")
  }
  
}
