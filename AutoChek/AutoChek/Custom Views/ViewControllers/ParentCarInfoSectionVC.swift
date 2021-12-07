//
//  ItemInfoVC.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 07/12/2021.
//

import UIKit

class ParentCarInfoSectionVC: UIViewController {
  
  // MARK: - PROPERTIES
  var carDetails: CarDetails!
  let stackView = UIStackView()
  let itemInfoViewOne = CarInfoMiniView()
  let itemInfoViewTwo = CarInfoMiniView()
  let actionButton = ACButton()
  
  // MARK: - INITIALIZERS
  init(carDetails: CarDetails) {
    super.init(nibName: nil, bundle: nil)
    self.carDetails = carDetails
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureBackgroundView()
    layoutSubviews()
    configureStackView()
  }
  
  // MARK: - CUSTOM METHODS
  private func configureBackgroundView() {
    view.layer.cornerRadius = 18
    view.backgroundColor = .systemGray5
  }
  
  private func configureStackView() {
    stackView.axis = .horizontal
    stackView.distribution = .equalSpacing

    stackView.addArrangedSubview(itemInfoViewOne)
    stackView.addArrangedSubview(itemInfoViewTwo)
  }
  
  private func layoutSubviews() {
    view.addSubview(stackView)
    view.addSubview(actionButton)
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    actionButton.layer.cornerRadius = 10
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      stackView.heightAnchor.constraint(equalToConstant: 70),
      
      actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -20),
      actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      actionButton.heightAnchor.constraint(equalToConstant: 45)
    ])
  }
}
