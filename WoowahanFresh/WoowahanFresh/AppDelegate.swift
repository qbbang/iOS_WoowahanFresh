//
//  AppDelegate.swift
//  WoowahanFresh
//
//  Created by qbbang on 26/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

import FacebookCore
import FacebookLogin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
//  var testArray: [Any] = []
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    //MARK: 네비, 탭바 컬러변경
    //FIXME: 왜 배경색이 안바뀌는거늬? -> 스토리보드 Bar Tint Color로 변경 하
//    UINavigationBar.appearance().tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//    UITabBar.appearance().tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    //MARK: 토큰 정보 저장
    if UserDefaults.standard.object(forKey: "UserLogin") != nil {
      print("AppDelegate : [forKey: \"UserLogin\"] 존재함")
      
      let tempToken = UserDefaults.standard.string(forKey: "UserLoginToken") ?? "nil"
      let tempName = UserDefaults.standard.string(forKey: "UserLoginName") ?? "nil"
      print("CheckToken :", tempToken)
      print("CheckName :", tempName)
      
      SingleUserInfo.sharedInstance.token = tempToken
      SingleUserInfo.sharedInstance.username = tempName
      
    }

    return true
//    return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  /*
  func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    
    
    return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    
    FBSDKAppEvents.activateApp()
  }*/
  
  
  
  
   // 페이스북 로그인
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    
    return SDKApplicationDelegate.shared.application(app, open: url, options: options)
  }
   
   // 디바이스 토큰 정보
   func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
   let   tokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
   print("deviceToken: \(tokenString)")
   }
  
  
  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }
  
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }
 
  
  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  
}

