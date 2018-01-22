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
    
    let buttonChangeColor = input.selectButton.do(onNext: { button in
      if button.backgroundColor == .red {
        button.backgroundColor = .purple
      } else {
        button.backgroundColor = .red
      }
    })
    
    return Output(fetching: fetching, buttonChangeColor: buttonChangeColor)
  }
}

extension SettingViewModel {
  struct Input {
    let selectButton: Driver<UIButton>
  }
  struct Output {
    let fetching: Driver<Bool>
    let buttonChangeColor: Driver<UIButton>
    
  }
}
