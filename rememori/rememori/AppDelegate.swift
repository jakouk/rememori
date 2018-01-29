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
  
  class var instance: AppDelegate? {
    return UIApplication.shared.delegate as? AppDelegate
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    setupKeyWindow()
    return true
  }
  
  private func setupKeyWindow() {
    window =  UIWindow(frame: UIScreen.main.bounds)
    let introViewModel = IntroViewModel()
    let introView = IntroViewController.create(with: introViewModel)
    window?.rootViewController = introView
    window?.makeKeyAndVisible()
  }
  
  func presentTabbarView() {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let homeViewModel = HomeViewModel()
    let homeView = HomeViewController.create(with: homeViewModel)
    homeView.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
    
    let studyViewModel = StudyViewModel()
    let studyView = StudyViewController.create(with: studyViewModel)
    studyView.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
    
    let settingViewModel = SettingViewModel()
    let settingView = SettingViewController.create(with: settingViewModel)
    settingView.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
    
    let quizViewModel = QuizViewModel()
    let quizView = QuizViewController.create(with: quizViewModel)
    quizView.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)
    
    let tabBarController = UITabBarController()
    
    let controllers = [homeView, studyView, quizView, settingView]
    tabBarController.viewControllers = controllers
    
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
  }
}

