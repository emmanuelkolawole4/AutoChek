//
//  CarTinyInfoView.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 07/12/2021.
//

import UIKit

enum ItemInfoType {
  case location, price, fuelType, engine, mileage
}

class CarInfoMiniView: UIView {
  
  // MARK: - PROPERTIES
  private let symbolImageView = UIImageView()
  private let titleLabel = ACTitleLabel(textAlignment: .left, fontSize: 16)
  private let subTitleLabel = ACTitleLabel(textAlignment: .left, fontSize: 16)
  
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - CUSTOM METHODS
  func setupUIElements(for itemInfoType: ItemInfoType, with carDetails: CarDetails) {
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = .currency
    currencyFormatter.locale = Locale(identifier: "ig_NG")

    let priceString = currencyFormatter.string(from: NSNumber(value: carDetails.marketplacePrice))
    
    switch itemInfoType {
    case .location:
      symbolImageView.image = Images.location
      titleLabel.text = carDetails.state
      subTitleLabel.text = carDetails.mileageUnit
    case .price:
      symbolImageView.image = Images.price
      titleLabel.text = priceString 
      subTitleLabel.text = carDetails.sellingCondition.uppercased()
    case .fuelType:
      symbolImageView.image = Images.fuel
      titleLabel.text = carDetails.fuelType
      subTitleLabel.text = "Warranty: \(carDetails.hasWarranty)"
    case .engine:
      symbolImageView.image = Images.engine
      titleLabel.text = carDetails.engineType
      subTitleLabel.text = carDetails.model?.wheelType
    case .mileage:
      symbolImageView.image = Images.mileage
      titleLabel.text = String(carDetails.mileage)
      subTitleLabel.text = carDetails.mileageUnit
    }
  }
  
  private func configure() {
    addSubview(symbolImageView)
    addSubview(titleLabel)
    addSubview(subTitleLabel)
    
    symbolImageView.translatesAutoresizingMaskIntoConstraints = false
    symbolImageView.contentMode = .scaleAspectFill
    symbolImageView.tintColor = .label
    
    NSLayoutConstraint.activate([
      symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
      symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      symbolImageView.heightAnchor.constraint(equalToConstant: 25),
      symbolImageView.widthAnchor.constraint(equalToConstant: 25),
      
      titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
      titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      titleLabel.heightAnchor.constraint(equalToConstant: 20),
      
      subTitleLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 10),
      subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      subTitleLabel.heightAnchor.constraint(equalToConstant: 20)
    ])

  }
}
