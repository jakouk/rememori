//
//  QuizViewController.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 9..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxSwift

final class QuizViewController: UIViewController, ViewType {

  // MARK: UI Metrics
  
  private struct UI {
    
  }
  
  // MARK: Properties
  
  var viewModel: QuizViewModelType!
  var disposeBag: DisposeBag!
  
  
  func setupUI() {
    view.backgroundColor = UIColor.white
  }
  
  func setupEventBinding() {
    rx.viewWillAppear
      .bind(to: viewModel.inputs.viewWillAppear)
      .disposed(by: disposeBag)
  }
  
  func setupUIBinding() {
    
  }
}
