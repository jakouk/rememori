//
//  StudyViewModel.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 9..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

protocol StudyViewModelType: ViewModelType {
  var viewWillAppear: PublishSubject<Void> { get }
}

// MARK: - Struct Implementation
struct StudyViewModel: StudyViewModelType {
  
  // MARK: Input
  // MARK: -> Event
  let viewWillAppear = PublishSubject<Void>()
  
  
  
  // MARK: Output
  // MARK: <- UI
  
  
  // MARK: Output
  // MARK: - Initialize
  init() {
    
  }
  
}
