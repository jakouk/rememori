//
//  ViewType.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 8..
//  Copyright © 2018년 kimin. All rights reserved.
//

import UIKit
import RxSwift

// MARK: - BaseView Protocol

protocol ViewType: class {
  associatedtype ViewModelType
  var viewModel: ViewModelType! { get set }
  var disposeBag: DisposeBag! { get set }
  func setupUI()
  func constraintUI()
  func setupEventBinding()
  func setupUIBinding()
}

extension ViewType where Self: UIViewController {
  static func create(with viewModel: ViewModelType) -> Self {
    let `self` = Self()
    self.viewModel = viewModel
    self.disposeBag = DisposeBag()
    self.loadViewIfNeeded()
    self.setupUI()
    self.constraintUI()
    self.setupEventBinding()
    self.setupUIBinding()
    return self
  }
}
