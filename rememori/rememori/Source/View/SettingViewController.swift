//
//  SettingViewController.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 10..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

final class SettingViewController: UIViewController, ViewTypes {

  var disposeBag: DisposeBag!
  var viewModel: SettingViewModel!
  var tableView = UITableView()
  var createPostButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
  }
  
  func setupUI() {
    view.backgroundColor = .green
    view.addSubview(createPostButton)
    
    createPostButton.backgroundColor = .red
  }
  
  func constraintUI() {
    createPostButton.snp.makeConstraints { make in
      make.top.left.equalTo(0).offset(30)
      make.width.equalTo(100)
      make.height.equalTo(30)
    }
  }
  
  func configureTableView() {
    tableView.refreshControl = UIRefreshControl()
    tableView.estimatedRowHeight = 64
    tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  func bindViewModel() {
    assert(viewModel != nil)
    
    let driver = createPostButton.rx.tap
      .map{ [weak self] _ in
        guard let `self` = self else {
          return UIButton()
        }
        return self.createPostButton
      }
      .asDriver(onErrorJustReturn: UIButton())
    
    let input = SettingViewModel.Input(selectButton: driver)
    let output = viewModel.transform(input: input)
    
    output.buttonChangeColor
      .drive()
      .disposed(by: disposeBag)
    
//    output.fetching
//      .drive(tableView.refreshControl!.rx.isRefreshing)
//      .disposed(by: disposeBag)
  }
  
}
