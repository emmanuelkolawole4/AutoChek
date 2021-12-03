//
//  SceneDelegate.swift
//  AutoChek
//
//  Created by FOLAHANMI KOLAWOLE on 02/12/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.rootViewController = createTabbar()
    window?.makeKeyAndVisible()
  }
  
  func createTabbar() -> UITabBarController {
    let tabbar = UITabBarController()
    UITabBar.appearance().tintColor = UIColor(red: (15/255), green: (19/255), blue: (39/255), alpha: 1)
    tabbar.viewControllers = [createHomeNC(), createFavoritesNC(), createNotificationsNC(), createMessagesNC()]
    
    return tabbar
  }
  
  func createHomeNC() -> UINavigationController {
    let homeVC = HomeVC()
    homeVC.title = "Explore"
    homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home"), tag: 0)
    
    return UINavigationController(rootViewController: homeVC)
  }
  
  func createFavoritesNC() -> UINavigationController {
    let favoritesListVC = FavoritesListVC()
    favoritesListVC.title = "Favorites"
    favoritesListVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "favorites"), tag: 1)

    return UINavigationController(rootViewController: favoritesListVC)
  }
  
  func createNotificationsNC() -> UINavigationController {
    let notificationsVC = NotificationsVC()
    notificationsVC.title = "Notifications"
    notificationsVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "bell"), tag: 2)

    return UINavigationController(rootViewController: notificationsVC)
  }
  
  func createMessagesNC() -> UINavigationController {
    let messagesVC = MessagesVC()
    messagesVC.title = "Messages"
    messagesVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "message.fill", withConfiguration:UIImage.SymbolConfiguration(weight: .regular)), tag: 3)

    return UINavigationController(rootViewController: messagesVC)
  }
  
  func sceneDidDisconnect(_ scene: UIScene) {}
  
  func sceneDidBecomeActive(_ scene: UIScene) {}
  
  func sceneWillResignActive(_ scene: UIScene) {}
  
  func sceneWillEnterForeground(_ scene: UIScene) {}
  
  func sceneDidEnterBackground(_ scene: UIScene) {}
  
}

