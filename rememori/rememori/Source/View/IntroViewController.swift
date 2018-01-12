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
    
    view.addSubviews([scrollView])
    scrollView.contentSize = UI.scrollViewContentSize
    scrollView.isPagingEnabled = true
    scrollView.snp.makeConstraints { make in
      make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
      make.left.right.equalTo(0)
      make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
    }
    
    scrollView.addSubviews([imageViews[0],imageViews[1]])
    imageViews[0].image = UIImage.init(named: "bg1")
    imageViews[1].image = UIImage.init(named: "bg2")
    imageViews[0].snp.makeConstraints { make in
      make.top.equalTo(scrollView.snp.top)
      make.left.equalTo(0)
      make.right.equalTo(imageViews[1].snp.left)
      make.bottom.equalTo(scrollView.snp.bottom)
      make.width.equalTo(imageViews[1].snp.width)
    }
    imageViews[1].snp.makeConstraints { make in
      make.top.equalTo(scrollView.snp.top)
      make.left.equalTo(imageViews[0].snp.right)
      make.right.equalTo(0)
      make.bottom.equalTo(scrollView.snp.bottom)
    }
    
    scrollView.addSubview(homeButton)
    homeButton.backgroundColor = .white
    
    homeButton.snp.makeConstraints { make in
      make.height.equalTo(44)
      make.width.equalTo(100)
      make.right.equalToSuperview().offset(-20)
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
      .drive(onNext: { void in
      AppDelegate.instance?.presentTabbarView()
    }).disposed(by: disposeBag)
    
  }
  
  // MARK: Action Handler
  
}
