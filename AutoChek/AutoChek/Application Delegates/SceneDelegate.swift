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
    configureNavigationBar()
  }
  
  func createTabbar() -> UITabBarController {
    let tabbar = UITabBarController()
    UITabBar.appearance().tintColor = #colorLiteral(red: 0.05882352941, green: 0.07450980392, blue: 0.1529411765, alpha: 1)
    tabbar.viewControllers = [createHomeNC(), createFavoritesNC(), createNotificationsNC(), createMessagesNC()]
    
    return tabbar
  }
  
  func createHomeNC() -> UINavigationController {
    let homeVC = HomeVC()
    homeVC.tabBarItem = UITabBarItem(title: nil, image: Images.home, tag: 0)
    return UINavigationController(rootViewController: homeVC)
  }
  
  func createFavoritesNC() -> UINavigationController {
    let favoritesListVC = FavoritesListVC()
    favoritesListVC.tabBarItem = UITabBarItem(title: nil, image: Images.favorites, tag: 1)
    return UINavigationController(rootViewController: favoritesListVC)
  }
  
  func createNotificationsNC() -> UINavigationController {
    let notificationsVC = NotificationsVC()
    notificationsVC.tabBarItem = UITabBarItem(title: nil, image: Images.bell, tag: 2)
    return UINavigationController(rootViewController: notificationsVC)
  }
  
  func createMessagesNC() -> UINavigationController {
    let messagesVC = MessagesVC()
    messagesVC.tabBarItem = UITabBarItem(title: nil, image: Images.messages, tag: 3)
    return UINavigationController(rootViewController: messagesVC)
  }
  
  func configureNavigationBar() {
    UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.05882352941, green: 0.07450980392, blue: 0.1529411765, alpha: 1)
  }
  
  func sceneDidDisconnect(_ scene: UIScene) {}
  
  func sceneDidBecomeActive(_ scene: UIScene) {}
  
  func sceneWillResignActive(_ scene: UIScene) {}
  
  func sceneWillEnterForeground(_ scene: UIScene) {}
  
  func sceneDidEnterBackground(_ scene: UIScene) {}
  
}

