//
//  HomeVC.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 02/12/2021.
//

import UIKit

class HomeVC: UIViewController {
  
  // MARK: - PROPERTIES
  enum Section {
    case main
  }
  
  private var popularCarBrands: [MakeList] = []
  private let gridLeftBarButton = UIButton()
  private let titleLabel = ACTitleLabel(textAlignment: .center, fontSize: 24)
  private let cartRightBarButton = UIButton()
  private let searchBar = ACTextField()
  private let filterButton = ACButton(btnImage: Home.Images.filter!, cornerRadius: 12)
  private var carBrandsCollection: UICollectionView!
  private var carsTable: UITableView!
  private var dataSource: UICollectionViewDiffableDataSource<Section, MakeList>!

  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewController()
    layoutSubviews()
    getPopularCarBrands()
    configureDataSource()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  // MARK: - CUSTOM METHODS
  private func configureViewController() {
    view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
  }
  
  private func configureGridLeftBarButton() {
    view.addSubview(gridLeftBarButton)
    gridLeftBarButton.translatesAutoresizingMaskIntoConstraints = false
    
    let image = Home.Images.grid
    gridLeftBarButton.setImage(image, for: .normal)
    gridLeftBarButton.imageView?.contentMode = .scaleAspectFit
    gridLeftBarButton.contentVerticalAlignment = .fill
    gridLeftBarButton.contentHorizontalAlignment = .fill
    gridLeftBarButton.addTarget(self, action: #selector(didTapGridBtn), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      gridLeftBarButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
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
    
    let image = Home.Images.cart
    cartRightBarButton.setImage(image, for: .normal)
    cartRightBarButton.imageView?.contentMode = .scaleAspectFit
    cartRightBarButton.contentVerticalAlignment = .fill
    cartRightBarButton.contentHorizontalAlignment = .fill
    cartRightBarButton.addTarget(self, action: #selector(didTapCartBtn), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      cartRightBarButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
      cartRightBarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      cartRightBarButton.widthAnchor.constraint(equalToConstant: 32),
      cartRightBarButton.heightAnchor.constraint(equalTo: cartRightBarButton.widthAnchor)
    ])
  }
  
  private func configureSearchBar() {
    view.addSubview(searchBar)
    searchBar.leftImage(Home.Images.search, imageWidth: 18, padding: 18)
    
    NSLayoutConstraint.activate([
      searchBar.topAnchor.constraint(equalTo: gridLeftBarButton.bottomAnchor, constant: 30),
      searchBar.leadingAnchor.constraint(equalTo: gridLeftBarButton.leadingAnchor),
      searchBar.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 130),
      searchBar.heightAnchor.constraint(equalToConstant: 60)
    ])
  }
  
  private func configureFilterButton() {
    view.addSubview(filterButton)
    
    NSLayoutConstraint.activate([
      filterButton.trailingAnchor.constraint(equalTo: cartRightBarButton.trailingAnchor),
      filterButton.lastBaselineAnchor.constraint(equalTo: searchBar.lastBaselineAnchor),
      filterButton.heightAnchor.constraint(equalToConstant: 60),
      filterButton.widthAnchor.constraint(equalToConstant: 60)
    ])
  }
  
  private func configureCarBrandsCollection() {
    carBrandsCollection = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHorizontalFlowLayout(in: view))
    view.addSubview(carBrandsCollection)
    carBrandsCollection.delegate = self
    carBrandsCollection.translatesAutoresizingMaskIntoConstraints = false
    carBrandsCollection.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
    carBrandsCollection.backgroundColor = .clear
    carBrandsCollection.showsHorizontalScrollIndicator = false
    carBrandsCollection.register(PopularCarBrandCell.self, forCellWithReuseIdentifier: PopularCarBrandCell.reuseIdentifier)
    
    NSLayoutConstraint.activate([
      carBrandsCollection.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
      carBrandsCollection.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
      carBrandsCollection.trailingAnchor.constraint(equalTo: filterButton.trailingAnchor),
//      carBrandsCollection.heightAnchor.constraint(equalToConstant: 130)
      carBrandsCollection.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.18)
    ])
  }
  
  private func configureCarsTable() {
    carsTable = UITableView()
    view.addSubview(carsTable)
    carsTable.separatorStyle = .none
    carsTable.showsVerticalScrollIndicator = false
    carsTable.backgroundColor = .clear
    carsTable.translatesAutoresizingMaskIntoConstraints = false
    carsTable.dataSource = self
    carsTable.delegate = self
    carsTable.register(CarCell.self, forCellReuseIdentifier: CarCell.reuseIdentifier)
    
    NSLayoutConstraint.activate([
//      carsTable.topAnchor.constraint(equalTo: carBrandsCollection.bottomAnchor, constant: 50),
      carsTable.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.53),
      carsTable.leadingAnchor.constraint(equalTo: carBrandsCollection.leadingAnchor),
      carsTable.trailingAnchor.constraint(equalTo: carBrandsCollection.trailingAnchor),
      carsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  private func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, MakeList>(collectionView: carBrandsCollection, cellProvider: { collectionView, indexPath, popularCarBrand in
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCarBrandCell.reuseIdentifier, for: indexPath) as? PopularCarBrandCell else { return UICollectionViewCell() }
      cell.set(popularCarBrand: popularCarBrand)
      return cell
    })
  }
  
  private func updateData(on popularCarBrands: [MakeList]) {
    var snapshot = NSDiffableDataSourceSnapshot<Section, MakeList>()
    snapshot.appendSections([.main])
    snapshot.appendItems(popularCarBrands)
    dataSource.apply(snapshot, animatingDifferences: true)
  }
  
  private func layoutSubviews() {
    configureGridLeftBarButton()
    configureTitleLabel()
    configureCartRightBarButton()
    configureSearchBar()
    configureFilterButton()
    configureCarBrandsCollection()
    configureCarsTable()
  }
  
  private func getPopularCarBrands() {
    showLoadingView(in: carBrandsCollection)
    NetworkManager.shared.getPopularCarBrands { [weak self] result in
      guard let self = self else { return }
      self.dismissLoadingView()
      switch result {
      case .success(let popularCarBrands):
        self.popularCarBrands = popularCarBrands.makeList
        DispatchQueue.main.async {
          self.updateData(on: self.popularCarBrands)
        }
      case .failure(let error):
        self.presentACAlertOnMainThread(title: "ERROR!!!", message: error.rawValue, buttonTitle: "OK")
      }
    }
  }
  
  
  // MARK: - OBJC METHODS
  @objc private func didTapGridBtn() {
    dump("grid btn tapped")
  }
  
  @objc private func didTapCartBtn() {
    dump("cart btn tapped")
  }

}

extension HomeVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: 80, height: 110)
  }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CarCell.reuseIdentifier, for: indexPath) as? CarCell else {
      fatalError("Error trying to dequeue cell of type \(CarCell.Type.self)")
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    400
  }
  
//  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//    let headerView = UIView()
////    headerView.backgroundColor = view.backgroundColor
//    return headerView
//  }
   
//  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//    return 30
//  }
//  
//  func numberOfSections(in tableView: UITableView) -> Int {
//    return 10
//  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
