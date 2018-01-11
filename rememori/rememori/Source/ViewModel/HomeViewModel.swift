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

protocol HomeViewModelType: ViewModelType {
  // Event
  var viewWillAppear: PublishSubject<Void> { get }
  
  
  // UI
  
}

struct HomeViewModel: HomeViewModelType {
  // MARK: Properties
  // MARK: -> Event
  
  let viewWillAppear = PublishSubject<Void>()
  
  // MARK: <- UI
  
  
  // MARK: - Initialize
  
  init() {
    
  }
  
}
