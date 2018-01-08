//
//  IntroViewModel.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 8..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift


protocol IntroViewModelType: ViewModelType {
  // Event
  var viewWillAppear: PublishSubject<Void> { get }
  
  
  // UI
  
  
}

// MARK: - Class Implementation

struct IntroViewModel: IntroViewModelType {
  // MARK: Properties
  // MARK: -> Event
  
  let viewWillAppear = PublishSubject<Void>()
  
  // MARK: <- UI
  
  
  // MARK: - Initialize
  
  init() {
    
  }
}
