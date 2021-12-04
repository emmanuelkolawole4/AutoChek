//
//  ACTitleLabel.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 03/12/2021.
//

import UIKit

class ACTitleLabel: UILabel {
  
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
    super.init(frame: .zero)
    self.textAlignment = textAlignment
    self.font = UIFont(name: "Gilroy-Bold", size: fontSize)
    configure()
  }
  
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    textColor = .label
    adjustsFontSizeToFitWidth = true
//    minimumScaleFactor = 0.9
//    lineBreakMode = .byTruncatingTail
    
    translatesAutoresizingMaskIntoConstraints = false
  }
}
