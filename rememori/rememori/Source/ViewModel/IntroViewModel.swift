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

protocol IntroViewModelType {
  var inputs: IntroViewModelInputs { get }
  var outputs: IntroViewModelOutputs { get }
}

// MARK: Input
// MARK: - Event
protocol IntroViewModelInputs {
  var viewWillAppear: PublishSubject<Void> { get }
  var didTapHomeButton: PublishSubject<Void> { get }
}

// MARK: Output
// MARK: - UI
protocol IntroViewModelOutputs {
  var showHome: Driver<String> { get }
}

// MARK: - Class Implementation
struct IntroViewModel: IntroViewModelType, IntroViewModelInputs, IntroViewModelOutputs {
  
  var inputs: IntroViewModelInputs { return self }
  var outputs: IntroViewModelOutputs { return self }
  
  // MARK: Input
  // MARK: -> Event
  let viewWillAppear = PublishSubject<Void>()
  let didTapHomeButton = PublishSubject<Void>()
  
  // MARK: Output
  // MARK: <- UI
  let showHome: Driver<String>
  
  // MARK: Output
  // MARK: - Initialize
  init() {
    showHome = didTapHomeButton
                .map { "didHomeButton" }
                .asDriver(onErrorJustReturn: "")
  }
}

