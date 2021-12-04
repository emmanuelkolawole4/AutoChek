//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by FOLAHANMI KOLAWOLE on 03/11/2021.
//

import UIKit

class ACPopularCarBrandImageView: UIImageView {
  
  // MARK: - PROPERTIES
  let cache = NetworkManager.shared.cache
  
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(cornerRadius: CGFloat) {
    super.init(frame: .zero)
    self.layer.cornerRadius = cornerRadius
    
    configure()
  }
  
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    clipsToBounds = true
    image = Home.Images.search
    
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = #colorLiteral(red: 0.9411487579, green: 0.9411157966, blue: 0.9496830106, alpha: 1)
  }
  
  func downloadImage(from urlString: String) {
    let cacheKey = NSString(string: urlString)
    if let image = cache.object(forKey: cacheKey) {
      self.image = image
      return
    }
    
    guard let url = URL(string: urlString) else { return }
    
    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let self = self else { return }
      if let _ = error { return }
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
      guard let data = data else { return }
      print(data)
      
      guard let image = UIImage(data: data) else {
//        dump("error creating image from data: \(error)")
        return
      }
      
      self.cache.setObject(image, forKey: cacheKey)
      
      DispatchQueue.main.async { self.image = image }
    }
    task.resume()
  }
}
