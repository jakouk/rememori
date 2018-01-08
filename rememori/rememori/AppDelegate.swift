//
//  AppDelegate.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 8..
//  Copyright © 2018년 kimin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    setupKeyWindow()
    return true
  }
  
  private func setupKeyWindow() {
    window =  UIWindow(frame: UIScreen.main.bounds)
    
    let introViewModel = IntroViewModel()
    let introView = IntroViewController.create(with: introViewModel)
    introView.view.backgroundColor = UIColor.white
    window?.rootViewController = introView
    window?.makeKeyAndVisible()
  }
}

