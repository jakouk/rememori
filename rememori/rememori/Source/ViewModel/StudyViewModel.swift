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
  // Event
  var viewWillAppear: PublishSubject<Void> { get }
  
  
  // UI
}

// MARK: - Class Implementation

struct StudyViewModel: QuizViewModelType {
  // MARK: Properties
  // MARK: -> Event
  
  let viewWillAppear = PublishSubject<Void>()
  
  // MARK: <- UI
  
  
  // MARK: - Initialize
  
  init() {
    
  }
  
}
