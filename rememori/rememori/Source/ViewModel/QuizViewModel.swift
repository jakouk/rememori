//
//  QuizViewModel.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 9..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

protocol QuizViewModelType {
  var inputs: QuizViewModelInputs { get }
  var outputs: QuizViewModelOutputs { get }
}

protocol QuizViewModelInputs {
  var viewWillAppear: PublishSubject<Void> { get }
}

protocol QuizViewModelOutputs {
  
}

// MARK: - Struct Implementation
struct QuizViewModel: QuizViewModelType, QuizViewModelInputs, QuizViewModelOutputs  {
  
  var inputs: QuizViewModelInputs { return self }
  var outputs: QuizViewModelOutputs { return self }
  
  
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
