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

final class SettingViewModel: ViewModelType {
  
  func transform(input: Input) -> Output {
    let activityIndicator = ActivityIndicator()
    let fetching = activityIndicator.asDriver()
    
    return Output(fetching: fetching)
  }
}

extension SettingViewModel {
  struct Input {
    let createPostTrigger: Driver<Void>
  }
  struct Output {
    let fetching: Driver<Bool>
  }
}
