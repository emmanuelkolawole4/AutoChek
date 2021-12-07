//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 03/11/2021.
//

import UIKit

class PopularCarBrandCell: UICollectionViewCell, ReuseIdentifying {
  
  // MARK: - PROPERTIES
  let popularCarBrandImageView = ACPopularCarBrandImageView(cornerRadius: 40)
  let popularCarBrandNameLabel = ACBodyLabel(textAlignment: .center, fontSize: 12)
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
  func set(popularCarBrand: MakeList) {
    popularCarBrandNameLabel.text = popularCarBrand.name
    popularCarBrandImageView.downloadImage(from: popularCarBrand.imageURL)
  }
  
  override func prepareForReuse() {
    popularCarBrandImageView.image = nil
  }
  
  private func configure() {
    backgroundColor = .clear
    addSubview(popularCarBrandImageView)
    addSubview(popularCarBrandNameLabel)
    
    NSLayoutConstraint.activate([
      popularCarBrandImageView.topAnchor.constraint(equalTo: topAnchor),
      popularCarBrandImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      popularCarBrandImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      popularCarBrandImageView.heightAnchor.constraint(equalTo: popularCarBrandImageView.widthAnchor),

      popularCarBrandNameLabel.topAnchor.constraint(equalTo: popularCarBrandImageView.bottomAnchor, constant: 12),
      popularCarBrandNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      popularCarBrandNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      popularCarBrandNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
