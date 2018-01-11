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
  var didTapHomeButton: PublishSubject<Void> { get }
  
  
  // UI
  var showHome: Driver<String> { get }
  
}

// MARK: - Class Implementation

struct IntroViewModel: IntroViewModelType {
  // MARK: Properties
  // MARK: -> Event
  
  let viewWillAppear = PublishSubject<Void>()
  let didTapHomeButton = PublishSubject<Void>()
  
  // MARK: <- UI
  let showHome: Driver<String>
  
  // MARK: - Initialize
  
  init() {
    print("IntroView")
    showHome = didTapHomeButton
                .map { "didHomeButton" }
                .asDriver(onErrorJustReturn: "")
    
  }
}
