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

protocol StudyViewModelType {
  var inputs: StudyViewModelInputs { get }
  var outputs: StudyViewModelOutputs { get }
}

protocol StudyViewModelInputs {
  var viewWillAppear: PublishSubject<Void> { get }
}

protocol StudyViewModelOutputs {
  
}

// MARK: - Struct Implementation
struct StudyViewModel: StudyViewModelType, StudyViewModelInputs, StudyViewModelOutputs {
  
  var inputs: StudyViewModelInputs { return self }
  var outputs: StudyViewModelOutputs { return self }
  
  
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
