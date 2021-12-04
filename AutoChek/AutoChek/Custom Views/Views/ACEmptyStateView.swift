//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 19/11/2021.
//

import UIKit

class ACEmptyStateView: UIView {
  
  let messageLabel = ACTitleLabel(textAlignment: .center, fontSize: 28)
  let logoImageView = UIImageView()
  
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(message: String) {
    super.init(frame: .zero)
    messageLabel.text = message
    configure()
  }
  
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    configureMessageLabel()
    configureLogoImageView()
  }

  private func configureMessageLabel() {
    addSubview(messageLabel)
    messageLabel.numberOfLines = 3
    messageLabel.textColor = .secondaryLabel
    
    NSLayoutConstraint.activate([
      messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
      messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
      messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
      messageLabel.heightAnchor.constraint(equalToConstant: 200)
    ])
  }
  
  private func configureLogoImageView() {
    addSubview(logoImageView)
//    logoImageView.image = Images.emptyStateImage
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
      logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
      logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 200),
      logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 70)
    ])
  }
  
}
