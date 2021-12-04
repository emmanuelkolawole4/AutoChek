//
//  ACButton.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 03/12/2021.
//

import UIKit

class ACButton: UIButton {
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(title: String, cornerRadius: CGFloat) {
    super.init(frame: .zero)
    
    self.backgroundColor = backgroundColor
    self.setTitle(title, for: .normal)
    layer.cornerRadius = cornerRadius
    configure()
  }
  
  init(btnImage: UIImage?, cornerRadius: CGFloat) {
    super.init(frame: .zero)
    guard let btnImage = btnImage else { return }
    self.setImage(btnImage, for: .normal)
    layer.cornerRadius = cornerRadius
    self.imageView?.contentMode = .scaleAspectFit
    configure()
  }
  
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    setTitleColor(UIColor(red: (255/255), green: (204/255), blue: (102/255), alpha: 1), for: .normal)
    titleLabel?.font = UIFont(name: "Gilroy-SemiBold", size: 15)
    
    backgroundColor = UIColor(red: (15/255), green: (19/255), blue: (39/255), alpha: 1)
    
    translatesAutoresizingMaskIntoConstraints = false
  }
}
