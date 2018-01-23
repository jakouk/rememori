//
//  HomeViewController.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 10..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

final class HomeViewController: UIViewController, ViewType {
  
  // MARK: UI Metrics
  
  private struct UI {
    
  }
  
  // MARK: Properties
  
  var viewModel: HomeViewModelType!
  var disposeBag: DisposeBag!
  
  
  func setupUI() {
    view.backgroundColor = UIColor.blue
  }
  
  func constraintUI() {
    
  }
  
  func setupEventBinding() {
    
  }
  
  func setupUIBinding() {
    
  }
}
