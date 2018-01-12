//
//  SettingViewModel.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 10..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

protocol SettingViewModelType {
  var inputs: SettingViewModelInputs { get }
  var outputs: SettingViewModelOutputs { get }
}

protocol SettingViewModelInputs {
  var viewWillAppear: PublishSubject<Void> { get }
}

protocol SettingViewModelOutputs {
  
}

struct SettingViewModel: SettingViewModelType, SettingViewModelInputs, SettingViewModelOutputs {

  var inputs: SettingViewModelInputs { return self }
  var outputs: SettingViewModelOutputs { return self }
  
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
