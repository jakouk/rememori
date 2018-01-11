//
//  SettingViewController.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 10..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

final class SettingViewController: UIViewController, ViewType {
  
  // MARK: UI Metrics
  
  private struct UI {
    
  }
  
  // MARK: Properties
  
  var viewModel: SettingViewModel!
  var disposeBag: DisposeBag!
  
  
  func setupUI() {
    view.backgroundColor = UIColor.yellow
  }
  
  func setupEventBinding() {
    
  }
  
  func setupUIBinding() {
    
  }
}
