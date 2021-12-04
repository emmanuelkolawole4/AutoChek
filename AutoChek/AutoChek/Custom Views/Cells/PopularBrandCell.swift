//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 03/11/2021.
//

import UIKit

class PopularBrandCell: UICollectionViewCell, ReuseIdentifying {
  
  // MARK: - PROPERTIES
  let brandImageView = ACAvatarImageView(frame: .zero)
  let popularBrandNameLabel = ACBodyLabel(textAlignment: .center)
  let padding: CGFloat = 8
  
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - CUSTOM FUNCTIONS
  func set(popularBrand: MakeList) {
    popularBrandNameLabel.text = popularBrand.name
    brandImageView.downloadImage(from: popularBrand.imageURL)
  }
  
  private func configure() {
    backgroundColor = .red
    addSubview(brandImageView)
    addSubview(popularBrandNameLabel)
    
    NSLayoutConstraint.activate([
      brandImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
      brandImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      brandImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      brandImageView.heightAnchor.constraint(equalTo: brandImageView.widthAnchor),
      
      popularBrandNameLabel.topAnchor.constraint(equalTo: brandImageView.bottomAnchor, constant: 12),
      popularBrandNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      popularBrandNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      popularBrandNameLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
}
