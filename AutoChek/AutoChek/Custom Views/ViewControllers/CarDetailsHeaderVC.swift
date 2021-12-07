//
//  CarDetailsHeaderVC.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 06/12/2021.
//

import UIKit

class CarDetailsHeaderVC: UIViewController {
  
  // MARK: - PROPERTIES
  private var carDetails: CarDetails
  private let carImageView = ACPopularCarBrandImageView(cornerRadius: 15)
  private let carNameLabel = ACTitleLabel(textAlignment: .left, fontSize: 24)
  private let carYearLabel = ACBodyLabel(textAlignment: .left, fontSize: 16)
  private let carTransmissionLabel = ACBodyLabel(textAlignment: .left, fontSize: 16)
  private let carBodyTypeLabel = ACBodyLabel(textAlignment: .left, fontSize: 16)

  // MARK: - INITIALIZERS
  init(carDetails: CarDetails) {
    self.carDetails = carDetails
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    addSubviews()
    layoutSubviews()
    setupUIElements()
  }
  
  // MARK: - CUSTOM METHODS
  private func addSubviews() {
    view.addSubview(carImageView)
    view.addSubview(carNameLabel)
    view.addSubview(carYearLabel)
    view.addSubview(carTransmissionLabel)
    view.addSubview(carBodyTypeLabel)
  }
  
  private func setupUIElements() {
    carImageView.downloadImage(from: carDetails.imageURL ?? "")
    carNameLabel.text = carDetails.carName
    carYearLabel.text = String(carDetails.year)
    carTransmissionLabel.text = carDetails.transmission
    carBodyTypeLabel.text = carDetails.bodyType.name
  }
  
  private func configureCarImageView() {
    NSLayoutConstraint.activate([
      carImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
      carImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      carImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
      carImageView.widthAnchor.constraint(equalTo: carImageView.heightAnchor),
    ])
  }
  
  private func configureCarNameLabel() {
    NSLayoutConstraint.activate([
      carNameLabel.topAnchor.constraint(equalTo: carImageView.topAnchor),
      carNameLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 12),
      carNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
      carNameLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func configureCarYearLabel() {
    NSLayoutConstraint.activate([
      carYearLabel.centerYAnchor.constraint(equalTo: carImageView.centerYAnchor, constant: -20),
      carYearLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 12),
      carYearLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
      carYearLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func configureCarTransmissionLabel() {
    NSLayoutConstraint.activate([
      carTransmissionLabel.centerYAnchor.constraint(equalTo: carImageView.centerYAnchor, constant: 16),
      carTransmissionLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 12),
      carTransmissionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
      carTransmissionLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func configureCarBodyTypeLabel() {
    NSLayoutConstraint.activate([
      carBodyTypeLabel.bottomAnchor.constraint(equalTo: carImageView.bottomAnchor),
      carBodyTypeLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 12),
      carBodyTypeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
      carBodyTypeLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func layoutSubviews() {
    configureCarImageView()
    configureCarNameLabel()
    configureCarYearLabel()
    configureCarTransmissionLabel()
    configureCarBodyTypeLabel()
  }
}
