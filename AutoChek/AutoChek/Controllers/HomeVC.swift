//
//  ViewController.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 02/12/2021.
//

import UIKit

class HomeVC: UIViewController {
  
  // MARK: - PROPERTIES
  private let gridLeftBarButton = UIButton()
  private let titleLabel = ACTitleLabel(textAlignment: .center, fontSize: 24)
  private let cartRightBarButton = UIButton()

  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewController()
    layoutSubviews()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  // MARK: - CUSTOM METHODS
  private func configureViewController() {
    view.backgroundColor = .systemBackground
  }
  
  private func configureGridLeftBarButton() {
    view.addSubview(gridLeftBarButton)
    gridLeftBarButton.translatesAutoresizingMaskIntoConstraints = false
    
    let image = UIImage(systemName: "square.grid.2x2.fill", withConfiguration:UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(UIColor(red: (15/255), green: (19/255), blue: (39/255), alpha: 1), renderingMode: .alwaysOriginal)
    gridLeftBarButton.setImage(image, for: .normal)
    gridLeftBarButton.imageView?.contentMode = .scaleAspectFit
    gridLeftBarButton.contentVerticalAlignment = .fill
    gridLeftBarButton.contentHorizontalAlignment = .fill
    gridLeftBarButton.addTarget(self, action: #selector(didTapGridBtn), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      gridLeftBarButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
      gridLeftBarButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      gridLeftBarButton.widthAnchor.constraint(equalToConstant: 32),
      gridLeftBarButton.heightAnchor.constraint(equalTo: gridLeftBarButton.widthAnchor)
    ])
  }
  
  private func configureTitleLabel() {
    view.addSubview(titleLabel)
    titleLabel.text = "Explore"
    
    NSLayoutConstraint.activate([
      titleLabel.leadingAnchor.constraint(equalTo: gridLeftBarButton.trailingAnchor, constant: 12),
      titleLabel.firstBaselineAnchor.constraint(equalTo: gridLeftBarButton.firstBaselineAnchor),
    ])
  }
  
  private func configureCartRightBarButton() {
    view.addSubview(cartRightBarButton)
    cartRightBarButton.translatesAutoresizingMaskIntoConstraints = false
    
    let image = UIImage(named: "cart")
    cartRightBarButton.setImage(image, for: .normal)
    cartRightBarButton.imageView?.contentMode = .scaleAspectFit
    cartRightBarButton.contentVerticalAlignment = .fill
    cartRightBarButton.contentHorizontalAlignment = .fill
    cartRightBarButton.addTarget(self, action: #selector(didTapCartBtn), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      cartRightBarButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
      cartRightBarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      cartRightBarButton.widthAnchor.constraint(equalToConstant: 32),
      cartRightBarButton.heightAnchor.constraint(equalTo: cartRightBarButton.widthAnchor)
    ])
  }
  
  private func layoutSubviews() {
    configureGridLeftBarButton()
    configureTitleLabel()
    configureCartRightBarButton()
  }
  
  // MARK: - OBJC METHODS
  @objc private func didTapGridBtn() {
    dump("grid btn tapped")
  }
  
  @objc private func didTapCartBtn() {
    dump("cart btn tapped")
  }

}

