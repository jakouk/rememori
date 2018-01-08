//
//  IntroViewController.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 8..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

final class IntroViewController: UIViewController, ViewType {
  
  // MARK: UI Metrics
  
  private struct UI {
    static let baseMargin = CGFloat(8)
    static let tableViewFrame = UIScreen.main.bounds
    static let estimatedRowHeight = CGFloat(80)
  }
  
  // MARK: Properties
  
  var viewModel: IntroViewModelType!
  var disposeBag: DisposeBag!
  
  // MARK: Setup UI
  
  func setupUI() {
    
  }
  
  // MARK: - -> Rx Event Binding
  
  func setupEventBinding() {
    rx.viewWillAppear
      .bind(to: viewModel.viewWillAppear)
      .disposed(by: disposeBag)
  }
  
  // MARK: - <- Rx UI Binding
  
  func setupUIBinding() {
    
  }
  
  // MARK: Action Handler
  
}
