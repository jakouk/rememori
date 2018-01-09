//
//  QuizViewModel.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 9..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxSwift
import RxCocoa

protocol QuizViewModelType: ViewModelType {
  // Event
  var viewWillAppear: PublishSubject<Void> { get }
  
  
  // UI
}

// MARK: - Class Implementation

struct QuizViewModel: QuizViewModelType {
  // MARK: Properties
  // MARK: -> Event
  
  let viewWillAppear = PublishSubject<Void>()
  
  // MARK: <- UI
  
  
  // MARK: - Initialize
  
  init() {
    
  }
}
