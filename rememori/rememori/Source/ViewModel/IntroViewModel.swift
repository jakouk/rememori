//
//  IntroViewModel.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 8..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxSwift

import CSV

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
  var showHome: Driver<Void> { get }
}

// MARK: - Struct Implementation
struct IntroViewModel: IntroViewModelType, IntroViewModelInputs, IntroViewModelOutputs {
  
  var inputs: IntroViewModelInputs { return self }
  var outputs: IntroViewModelOutputs { return self }
  
  // MARK: Input
  // MARK: -> Event
  let viewWillAppear = PublishSubject<Void>()
  let didTapHomeButton = PublishSubject<Void>()
  
  
  // MARK: Output
  // MARK: <- UI
  let showHome: Driver<Void>
  
  
  // MARK: Output
  // MARK: - Initialize
  init() {
    showHome = didTapHomeButton
                .asDriver(onErrorJustReturn: () )
    
    let stream = InputStream(fileAtPath: "/Users/unbTech/desktop/demo.csv")!
    let csv = try! CSVReader(stream: stream)
    while let row = csv.next() {
      print("\(row)")
    }
  }
}

