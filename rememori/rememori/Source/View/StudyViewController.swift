//
//  StudyViewController.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 9..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

final class StudyViewController: UIViewController, ViewType {
  
  // MARK: UI Metrics
  
  private struct UI {
    
  }
  
  // MARK: Properties
  
  var viewModel: StudyViewModelType!
  var disposeBag: DisposeBag!
  
  
  func setupUI() {
    view.backgroundColor = UIColor.yellow
  }
  
  func constraintUI() {
    
  }
  
  func setupEventBinding() {
    
  }
  
  func setupUIBinding() {
    
  }
}
