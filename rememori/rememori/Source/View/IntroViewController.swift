//
//  IntroViewController.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 8..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxSwift
import SnapKit

final class IntroViewController: UIViewController, ViewType {
  
  // MARK: UI Metrics
  private struct UI {
    static let scrollViewFrame = UIScreen.main.bounds
    static let scrollViewContentSize = CGSize(width: UIScreen.main.bounds.size.width * 2, height: UIScreen.main.bounds.size.height )
  }
  
  // MARK: Properties
  var viewModel: IntroViewModelType!
  var disposeBag: DisposeBag!
  private let scrollView = UIScrollView()
  private let imageViews = [UIImageView() ,UIImageView()]
  private let homeButton = UIButton()
  
  // MARK: Setup UI
  func setupUI() {
    
    view.backgroundColor = UIColor.white
    
    view.addSubview(scrollView)
    scrollView.contentSize = UI.scrollViewContentSize
    scrollView.isPagingEnabled = true
    
    scrollView.addSubviews([imageViews[0],imageViews[1]])
    imageViews[0].image = UIImage.init(named: "bg1")
    imageViews[1].image = UIImage.init(named: "bg2")
    
    scrollView.addSubview(homeButton)
    homeButton.backgroundColor = .white
  }
  
  func constraintUI() {
    
    scrollView.snp.makeConstraints { make in
      make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
      make.leading.trailing.equalTo(0)
      make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
    }
    
    imageViews[0].snp.makeConstraints { make in
      make.top.equalTo(scrollView.snp.top)
      make.leading.equalTo(0)
      make.trailing.equalTo(imageViews[1].snp.leading)
      make.bottom.equalTo(scrollView.snp.bottom)
      make.width.equalTo(imageViews[1].snp.width)
    }
    
    imageViews[1].snp.makeConstraints { make in
      make.top.equalTo(scrollView.snp.top)
      make.leading.equalTo(imageViews[0].snp.trailing)
      make.trailing.equalTo(0)
      make.bottom.equalTo(scrollView.snp.bottom)
    }
    
    homeButton.snp.makeConstraints { make in
      make.height.equalTo(44)
      make.width.equalTo(100)
      make.trailing.equalToSuperview().offset(-20)
      make.bottom.equalToSuperview().offset(-20)
    }
  }
  
  // MARK: - -> Rx Event Binding
  func setupEventBinding() {
    rx.viewWillAppear
      .bind(to: viewModel.inputs.viewWillAppear)
      .disposed(by: disposeBag)
    
    homeButton.rx.tap
      .bind(to: viewModel.inputs.didTapHomeButton)
      .disposed(by: disposeBag)
  }
  
  // MARK: - <- Rx UI Binding
  func setupUIBinding() {
    viewModel.outputs.showHome
      .drive(onNext: {
      AppDelegate.instance?.presentTabbarView()
    }).disposed(by: disposeBag)
  }
  
  // MARK: Action Handler
}
