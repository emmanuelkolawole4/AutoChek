//
//  UIHelper.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 03/12/2021.
//

import UIKit

enum UIHelper {
  
  static func createHorizontalFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    
    return flowLayout
  }
}
