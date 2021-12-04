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
    layer.borderColor = UIColor.systemGray4.cgColor
    
    textColor = .label
    tintColor = .label
    font = UIFont(name: "Gilroy-SemiBold", size: 18)
    adjustsFontSizeToFitWidth = true
    minimumFontSize = 16
    
    backgroundColor = .tertiarySystemBackground
    
    autocorrectionType = .no
    
    placeholder = "Search" //StringConstants.SearchVC.GFTextField.placeholderText
    
    returnKeyType = .search
    clearButtonMode = .whileEditing
    
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect { bounds.inset(by: insets) }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect { bounds.inset(by: insets) }
}


