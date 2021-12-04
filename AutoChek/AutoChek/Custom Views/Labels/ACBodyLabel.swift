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
  
  init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
    super.init(frame: .zero)
    self.textAlignment = textAlignment
    self.font = UIFont(name: "Gilroy-SemiBold", size: fontSize)
    configure()
  }
  
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    textColor = #colorLiteral(red: 0.05882352941, green: 0.07450980392, blue: 0.1529411765, alpha: 1)
    
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = 0.7
    lineBreakMode = .byWordWrapping
    
    translatesAutoresizingMaskIntoConstraints = false
  }
}
