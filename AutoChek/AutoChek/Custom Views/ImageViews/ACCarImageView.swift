//
//  ACCarImageView.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 05/12/2021.
//

import UIKit

class ACCarImageView: UIImageView {
  
  // MARK: - PROPERTIES
  let cache = NetworkManager.shared.cache
  
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init() {
    super.init(frame: .zero)
    configure()
  }
  
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    layer.cornerRadius = 10
    layer.borderColor = #colorLiteral(red: 0.995991528, green: 0.9961339831, blue: 0.9959602952, alpha: 1)
    layer.borderWidth = 2
    
    clipsToBounds = true
    contentMode = .scaleAspectFit
    
    translatesAutoresizingMaskIntoConstraints = false
  }
}
