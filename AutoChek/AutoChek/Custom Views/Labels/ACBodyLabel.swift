//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 18/10/2021.
//

import UIKit

class ACBodyLabel: UILabel {

  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(textAlignment: NSTextAlignment) {
    super.init(frame: .zero)
    self.textAlignment = textAlignment
    configure()
  }
  
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    textColor = .secondaryLabel
    self.font = UIFont(name: "Gilroy-Bold", size: 16)
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = 0.75
    lineBreakMode = .byWordWrapping
    
    translatesAutoresizingMaskIntoConstraints = false
  }
}
