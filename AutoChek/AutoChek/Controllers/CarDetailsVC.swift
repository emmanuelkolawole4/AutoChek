//
//  CarDetailsVC.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 06/12/2021.
//

import UIKit

class CarDetailsVC: UIViewController {
  
  // MARK: - PROPERTIES
  private var car: Car
  private let headerView = UIView()
  private let itemViewOne = UIView()
  private let itemViewTwo = UIView()
  private var itemViews: [UIView] = []
  
  // MARK: - INITIALIZERS
  init(with car: Car) {
    self.car = car
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewController()
    layoutSubviews()
    getCarDetails(from: car.id)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  // MARK: - CUSTOM FUNCTIONS
  private func configureViewController() {
    view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
  }
  
  private func getCarDetails(from carID: String) {
    NetworkManager.shared.getCarDetails(from: car.id) { result in
      switch result {
      case .success(let carDetails):
        DispatchQueue.main.async {
          self.add(childVC: CarDetailsHeaderVC(carDetails: carDetails), to: self.headerView)
          self.add(childVC: ChildCarInfoSectionVC(carDetails: carDetails), to: self.itemViewOne)
          self.add(childVC: ChildCarInfoTwoSectionVC(carDetails: carDetails), to: self.itemViewTwo)
        }
      case .failure(let error):
        self.presentACAlertOnMainThread(title: "ERROR!!!", message: error.rawValue, buttonTitle: "OK!")
      }
    }
  }
  
  private func addSubviews() {
    itemViews = [headerView, itemViewOne, itemViewTwo]
    for itemView in itemViews {
      view.addSubview(itemView)
      itemView.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func layoutSubviews() {
    addSubviews()
    
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
      
      itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
      itemViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      itemViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      itemViewOne.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
      
      itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: 20),
      itemViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      itemViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      itemViewTwo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
      
    ])
  }
  
  private func add(childVC: UIViewController, to containerView: UIView) {
    addChild(childVC)
    containerView.addSubview(childVC.view)
    childVC.view.frame = containerView.bounds
    childVC.didMove(toParent: self)
  }
}
