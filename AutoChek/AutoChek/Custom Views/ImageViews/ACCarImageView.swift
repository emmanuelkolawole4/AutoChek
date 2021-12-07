//
//  ACCarImageView.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 05/12/2021.
//

import UIKit

class ACCarImageView: UIImageView {
  
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
  
  init() {
    super.init(frame: .zero)
    configure()
  }
  
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    layer.cornerRadius = 25
    layer.borderColor = #colorLiteral(red: 0.995991528, green: 0.9961339831, blue: 0.9959602952, alpha: 1)
    layer.borderWidth = 2
    
    clipsToBounds = true
    contentMode = .scaleAspectFill
    
    translatesAutoresizingMaskIntoConstraints = false
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
      
      guard let image = UIImage(data: data) else {
        return
      }
      
      self.cache.setObject(image, forKey: cacheKey)
      
      DispatchQueue.main.async { self.image = image }
    }
    task.resume()
  }
}
