//
//  AppDelegate.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/20.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import KakaoOpenSDK
import FBSDKLoginKit
import FBSDKShareKit
import GoogleMaps
import GooglePlaces
#if DEBUG
import Gedatsu
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    #if DEBUG
    Gedatsu.open()
    #endif
    
    GMSServices.provideAPIKey("AIzaSyDY0ppRrZhsxpXVHhJ4qZRWLMcpEhCjDgY")
    GMSPlacesClient.provideAPIKey("AIzaSyDY0ppRrZhsxpXVHhJ4qZRWLMcpEhCjDgY")
    
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let mainVC = MainTabBarViewController()
//    let mainVC = NewMainRoomViewController()
    window?.rootViewController = mainVC
    window?.makeKeyAndVisible()
//    UINavigationController(rootViewController: FavoriteListViewController())
    ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    KOSession.shared()?.isAutomaticPeriodicRefresh = true
    
    return true
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    KOSession.handleDidEnterBackground()
  }
  
  
  
  func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    if KOSession.handleOpen(url) || ApplicationDelegate.shared.application(
      application,
      open: url,
      sourceApplication: sourceApplication,
      annotation: annotation
      ) {
      return true
    }
    return false
  }
  @available(iOS 9.0, *)
  internal func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
    if KOSession.handleOpen(url) || ApplicationDelegate.shared.application(app, open: url, options: options) {
      return true
    }
    return false
  }
  
  
  
  
  
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    AppEvents.activateApp()
  }
  
}

