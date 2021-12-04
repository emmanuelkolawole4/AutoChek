//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 18/10/2021.
//

import UIKit

class ACAlertVC: UIViewController {
  
  // MARK: - PROPERTIES
  let containerView = ACAlertContainerView()
  let titleLabel = ACTitleLabel(textAlignment: .center, fontSize: 20)
  let messageLabel = ACBodyLabel(textAlignment: .center, fontSize: 16)
  let callToActionButton = ACButton(title: "OK!", cornerRadius: 10) 
  let padding: CGFloat = 20
  
  var alertTitle: String?
  var alertMessage: String?
  var alertButtonTitle: String?
  
  // MARK: - INITIALIZERS
  init(title: String, message: String, buttonTitle: String) {
    super.init(nibName: nil, bundle: nil)
    self.alertTitle = title
    self.alertMessage = message
    self.alertButtonTitle = buttonTitle
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Colors.transparentBlack
    layoutSubviews()
  }
  
  // MARK: - CUSTOM FUNCTIONS
  @objc func dismissVC() {
    dismiss(animated: true)
  }
  
  func configureContainerView() {
    view.addSubview(containerView)
    
    NSLayoutConstraint.activate([
      containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      containerView.widthAnchor.constraint(equalToConstant: 280),
      containerView.heightAnchor.constraint(equalToConstant: 220)
    ])
  }
  
  func configureTitleLabel() {
    containerView.addSubview(titleLabel)
    titleLabel.text = alertTitle ?? "Something went wrong!"
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
      titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      titleLabel.heightAnchor.constraint(equalToConstant: 28)
    ])
  }
  
  func configureCallToActionButton() {
    containerView.addSubview(callToActionButton)
    callToActionButton.setTitle(alertButtonTitle ?? "OK", for: .normal)
    callToActionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      callToActionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
      callToActionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      callToActionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      callToActionButton.heightAnchor.constraint(equalToConstant: 44)
    ])
  }
  
  func configureMessageLabel() {
    containerView.addSubview(messageLabel)
    messageLabel.text = alertMessage ?? "Unable to complete request!"
    messageLabel.numberOfLines = 4
    
    NSLayoutConstraint.activate([
      messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
      messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      messageLabel.bottomAnchor.constraint(equalTo: callToActionButton.topAnchor, constant: -12)
    ])
  }
  
  func layoutSubviews() {
    configureContainerView()
    configureTitleLabel()
    configureCallToActionButton()
    configureMessageLabel()
  }
}
