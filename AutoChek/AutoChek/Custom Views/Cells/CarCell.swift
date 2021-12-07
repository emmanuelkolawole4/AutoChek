//
//  CarCell.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 05/12/2021.
//

import UIKit

class CarCell: UITableViewCell, ReuseIdentifying {
  
  // MARK: - PROPERTIES
  private let card = ACAlertContainerView()
  private let carCardImageView = ACCarImageView()
  private let carNameLabel = ACTitleLabel(textAlignment: .left, fontSize: 24)
  private let carYearLabel = ACBodyLabel(textAlignment: .left, fontSize: 18)
  private let carPriceLabel = ACBodyLabel(textAlignment: .left, fontSize: 18)
  private let addToCartButton = ACButton(btnImage: Images.plus, cornerRadius: 25)
  
  // MARK: - INITIALIZERS
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor =  .clear
    selectionStyle = .none
    layoutSubViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - CUSTOM METHODS
  func set(car: Car) {
    carNameLabel.text = car.title
    carYearLabel.text = String(car.year)
    carPriceLabel.text = String(car.marketplacePrice)
    carCardImageView.downloadImage(from: car.imageURL)
  }
  
  private func configureCard() {
    addSubview(card)
    card.backgroundColor = .white
    card.layer.cornerRadius = 25
    card.layer.borderWidth = 0
    card.layer.borderColor = nil
    
    NSLayoutConstraint.activate([
      card.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
      card.leadingAnchor.constraint(equalTo: leadingAnchor),
      card.trailingAnchor.constraint(equalTo: trailingAnchor),
      card.heightAnchor.constraint(equalToConstant: 280)
    ])
  }
    
  private func configureProductCardImageView() {
    card.addSubview(carCardImageView)
    carCardImageView.backgroundColor =  #colorLiteral(red: 0.9234039783, green: 0.9127511382, blue: 0.965048492, alpha: 1)
    
      
    NSLayoutConstraint.activate([
      carCardImageView.topAnchor.constraint(equalTo: card.topAnchor, constant: -80),
      carCardImageView.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 30),
      carCardImageView.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -30),
      carCardImageView.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -120)
    ])
    }
  
  private func configureCarNameLabel() {
    card.addSubview(carNameLabel)
    
    NSLayoutConstraint.activate([
      carNameLabel.topAnchor.constraint(equalTo: carCardImageView.bottomAnchor, constant: 15),
      carNameLabel.leadingAnchor.constraint(equalTo: carCardImageView.leadingAnchor)
    ])
  }
  
  private func configureCarYearLabel() {
    card.addSubview(carYearLabel)
    carYearLabel.textColor = #colorLiteral(red: 0.7874763608, green: 0.7921344638, blue: 0.8093597293, alpha: 1)
    
    NSLayoutConstraint.activate([
      carYearLabel.topAnchor.constraint(equalTo: carNameLabel.bottomAnchor, constant: 15),
      carYearLabel.leadingAnchor.constraint(equalTo: carCardImageView.leadingAnchor)
    ])
  }
  
  private func configureCarPriceLabel() {
    card.addSubview(carPriceLabel)
    
    NSLayoutConstraint.activate([
      carPriceLabel.topAnchor.constraint(equalTo: carYearLabel.bottomAnchor, constant: 15),
      carPriceLabel.leadingAnchor.constraint(equalTo: carCardImageView.leadingAnchor)
    ])
  }
  
  private func configureAddToCartButton() {
    card.addSubview(addToCartButton)
    addToCartButton.backgroundColor = #colorLiteral(red: 0.05882352941, green: 0.07450980392, blue: 0.1529411765, alpha: 1)
    
    NSLayoutConstraint.activate([
      addToCartButton.trailingAnchor.constraint(equalTo: carCardImageView.trailingAnchor),
      addToCartButton.bottomAnchor.constraint(equalTo: carPriceLabel.bottomAnchor),
      addToCartButton.widthAnchor.constraint(equalToConstant: 50),
      addToCartButton.heightAnchor.constraint(equalToConstant: 50)
    ])
    
  }
  
  private func layoutSubViews() {
    configureCard()
    configureProductCardImageView()
    configureCarNameLabel()
    configureCarYearLabel()
    configureCarPriceLabel()
    configureAddToCartButton()
  }
}
