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
    static let baseMargin = CGFloat(8)
    static let scrollViewFrame = UIScreen.main.bounds
    static let scrollViewContentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height )
    static let estimatedRowHeight = CGFloat(80)
  }
  
  // MARK: Properties
  
  var viewModel: IntroViewModelType!
  var disposeBag: DisposeBag!
  private let scrolView = UIScrollView(frame: UI.scrollViewFrame)
  private let imageViews = [UIImageView(),UIImageView()]
  
  // MARK: Setup UI
  
  func setupUI() {
    view.backgroundColor = UIColor.white
    
    imageViews[0].image = UIImage.init(named: "bg1")
    imageViews[1].image = UIImage.init(named: "bg2")
    
    imageViews[0].snp.makeConstraints { make in
      
    }
    
    scrolView.contentSize = UI.scrollViewContentSize
    scrolView.isPagingEnabled = true
    
    view.addSubviews([scrolView])
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
