//
//  HomeViewModel.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 10..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

protocol HomeViewModelType {
  var inputs: HomeViewModelInputs { get }
  var outputs: HomeViewModelOutputs { get }
}

protocol HomeViewModelInputs {
  var viewWillAppear: PublishSubject<Void> { get }
}

protocol HomeViewModelOutputs {
}

struct HomeViewModel: HomeViewModelType, HomeViewModelInputs, HomeViewModelOutputs {

  var inputs: HomeViewModelInputs { return self }
  var outputs: HomeViewModelOutputs { return self }
  
  
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
