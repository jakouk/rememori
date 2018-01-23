//
//  ViewTypes.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 18..
//  Copyright © 2018년 kimin. All rights reserved.
//

import UIKit
import RxSwift

// MARK: - BaseView Protocol

protocol ViewTypes: class {
  associatedtype ViewModelType
  var viewModel: ViewModelType! { get set }
  var disposeBag: DisposeBag! { get set }
  func setupUI()
  func constraintUI()
  func bindViewModel()
}

extension ViewTypes where Self: UIViewController {
  static func create(with viewModel: ViewModelType) -> Self {
    let `self` = Self()
    self.viewModel = viewModel
    self.disposeBag = DisposeBag()
    self.loadViewIfNeeded()
    self.setupUI()
    self.constraintUI()
    self.bindViewModel()
    return self
  }
}
