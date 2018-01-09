//
//  IntroViewController.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 8..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift
import SnapKit

final class IntroViewController: UIViewController, ViewType {
  
  // MARK: UI Metrics
  
  private struct UI {
//    static let baseMargin = CGFloat(8)
    static let scrollViewFrame = UIScreen.main.bounds
    static let scrollViewContentSize = CGSize(width: UIScreen.main.bounds.size.width * 2, height: UIScreen.main.bounds.size.height )
//    static let estimatedRowHeight = CGFloat(80)
  }
  
  // MARK: Properties
  
  var viewModel: IntroViewModelType!
  var disposeBag: DisposeBag!
  private let scrolView = UIScrollView()
  private let imageViews = [UIImageView() ,UIImageView()]
  
  // MARK: Setup UI
  
  func setupUI() {
    
    view.backgroundColor = UIColor.white
    view.addSubviews([scrolView])
    
    scrolView.contentSize = UI.scrollViewContentSize
    scrolView.isPagingEnabled = true
    
    scrolView.snp.makeConstraints { make in
      make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
      make.left.equalTo(0)
      make.right.equalTo(0)
      make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
    }
    
    imageViews[0].image = UIImage.init(named: "bg1")
    imageViews[1].image = UIImage.init(named: "bg2")
    
    scrolView.addSubviews([imageViews[0],imageViews[1]])
    
    imageViews[0].snp.makeConstraints { make in
      make.top.equalTo(scrolView.snp.top)
      make.left.equalTo(0)
      make.right.equalTo(imageViews[1].snp.left)
      make.bottom.equalTo(scrolView.snp.bottom)
      make.width.equalTo(imageViews[1].snp.width)
    }
    
    imageViews[1].snp.makeConstraints { make in
      make.top.equalTo(scrolView.snp.top)
      make.left.equalTo(imageViews[0].snp.right)
      make.right.equalTo(0)
      make.bottom.equalTo(scrolView.snp.bottom)
      //make.width.equalTo(imageViews[0].snp.width)
    }
    
  }
  
  // MARK: - -> Rx Event Binding
  
  func setupEventBinding() {
    rx.viewWillAppear
      .bind(to: viewModel.viewWillAppear)
      .disposed(by: disposeBag)
  }
  
  // MARK: - <- Rx UI Binding
  
  func setupUIBinding() {
    
  }
  
  // MARK: Action Handler
  
}
