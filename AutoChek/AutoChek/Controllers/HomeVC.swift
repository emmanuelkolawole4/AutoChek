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
  
  var pageSize = 50
  var hasMoreCars = true
  private var popularCarBrands: [MakeList] = []
  private var cars: [Car] = []
  private let gridLeftBarButton = UIButton()
  private let titleLabel = ACTitleLabel(textAlignment: .center, fontSize: 24)
  private let cartRightBarButton = UIButton()
  private let searchBar = ACTextField()
  private let filterButton = ACButton(btnImage: Home.Images.filter!, cornerRadius: 12)
  private var carBrandsCollection: UICollectionView!
  private var carsTable: UITableView!
  private var collectionViewDataSource: UICollectionViewDiffableDataSource<Section, MakeList>!
  private var tableViewDataSource: UITableViewDiffableDataSource<Section, Car>!

  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewController()
    layoutSubviews()
    getPopularCarBrands()
    getCars()
    configureCollectionViewDataSource()
    configureTableViewDataSource()
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
    carsTable.delegate = self
    carsTable.register(CarCell.self, forCellReuseIdentifier: CarCell.reuseIdentifier)
    
    NSLayoutConstraint.activate([
      carsTable.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.53),
      carsTable.leadingAnchor.constraint(equalTo: carBrandsCollection.leadingAnchor),
      carsTable.trailingAnchor.constraint(equalTo: carBrandsCollection.trailingAnchor),
      carsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  private func configureCollectionViewDataSource() {
    collectionViewDataSource = UICollectionViewDiffableDataSource<Section, MakeList>(collectionView: carBrandsCollection, cellProvider: { collectionView, indexPath, popularCarBrand in
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCarBrandCell.reuseIdentifier, for: indexPath) as? PopularCarBrandCell else { return UICollectionViewCell() }
      cell.set(popularCarBrand: popularCarBrand)
      return cell
    })
  }
  
  private func configureTableViewDataSource() {
    tableViewDataSource = UITableViewDiffableDataSource<Section, Car>(tableView: carsTable, cellProvider: { tableView, indexPath, car in
      guard let cell = tableView.dequeueReusableCell(withIdentifier: CarCell.reuseIdentifier, for: indexPath) as? CarCell else {
        return UITableViewCell()
      }
      cell.set(car: car)
      return cell
    })
  }
  
  private func updateData(on popularCarBrands: [MakeList]) {
    var snapshot = NSDiffableDataSourceSnapshot<Section, MakeList>()
    snapshot.appendSections([.main])
    snapshot.appendItems(popularCarBrands)
    collectionViewDataSource.apply(snapshot, animatingDifferences: true)
  }
  
  private func updateData(on cars: [Car]) {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Car>()
    snapshot.appendSections([.main])
    snapshot.appendItems(cars)
    tableViewDataSource.apply(snapshot, animatingDifferences: true)
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
    
    
//    NetworkManager.shared.fetchData(from: popularBrandsEndpoint, pageSize: nil, resultType: PopularCarBrand.self) { [weak self] result in
//      guard let self = self else { return }
//      self.dismissLoadingView()
//      switch result {
//      case .success(let popularCarBrands):
//        self.popularCarBrands = popularCarBrands.makeList
//        DispatchQueue.main.async {
//          self.updateData(on: self.popularCarBrands)
//        }
//      case .failure(let error):
//        self.presentACAlertOnMainThread(title: "ERROR!!!", message: error.rawValue, buttonTitle: "OK")
//      }
//    }
  }
  
  private func getCars() {
    NetworkManager.shared.getCars(pageSize: 10) { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success(let cars):
        if cars.pagination.total < 24 { self.hasMoreCars = false }
        self.cars.append(contentsOf: cars.result)
        DispatchQueue.main.async {
          self.updateData(on: self.cars)
        }
      case .failure(let error):
        self.presentACAlertOnMainThread(title: "ERROR!!!", message: error.rawValue, buttonTitle: "OK")
      }
    }
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

extension HomeVC: UITableViewDelegate {
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    let offsetY = scrollView.contentOffset.y
    let contentHeight = scrollView.contentSize.height
    let height = scrollView.frame.size.height
    
    if offsetY > contentHeight - height {
      guard hasMoreCars else { return }
      pageSize += 50
//      getCars()
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 400 }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let car = cars[indexPath.item]
    let destinationVC = CarDetailsVC(with: car)
    navigationController?.pushViewController(destinationVC, animated: true)
  }
}
