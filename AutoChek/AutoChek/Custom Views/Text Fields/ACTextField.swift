//
//  ACTextField.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 03/12/2021.
//

import UIKit

class ACTextField: UITextField {
  
  // MARK: - PROPERTIES
  private let insets: UIEdgeInsets
  
  // MARK: - INITIALIZERS
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(with insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 20)) {
    self.insets = insets
    super.init(frame: .zero)
    
    configure()
  }
  
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    layer.cornerRadius = 10
    layer.borderWidth = 2
    layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    textColor = #colorLiteral(red: 0.05882352941, green: 0.07450980392, blue: 0.1529411765, alpha: 1)
    tintColor = #colorLiteral(red: 0.05882352941, green: 0.07450980392, blue: 0.1529411765, alpha: 1)
    font = UIFont(name: "Gilroy-SemiBold", size: 18)
    adjustsFontSizeToFitWidth = true
    minimumFontSize = 16
    
    backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 0.9082459709)
    
    autocorrectionType = .no
    
    placeholder = "Search"
    
    returnKeyType = .search
    clearButtonMode = .whileEditing
    
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect { bounds.inset(by: insets) }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect { bounds.inset(by: insets) }
}


