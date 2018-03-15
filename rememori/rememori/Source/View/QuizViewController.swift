//
//  QuizViewController.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 9..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxSwift

final class QuizViewController: UIViewController, ViewType {


  // MARK: UI Metrics
  
  private struct UI {
    static let viewBorderWith = CGFloat(0.5)
    static let viewBorderColor = UIColor.black.cgColor
  }
  
  // MARK: Properties
  
  var viewModel: QuizViewModelType!
  var disposeBag: DisposeBag!
  
  private let quizView = UIView()
  private let chooseView = UIView()
  
  private let problemView = UIView()
  private let problemLabel = UILabel()
  
  private let firstButton = UIButton()
  private let secondButton = UIButton()
  private let thirdButton = UIButton()
  private let fourthButton = UIButton()
  
  func setupUI() {
    view.backgroundColor = UIColor.white
    
    quizView.backgroundColor = .white
    
    view.addSubview(quizView)
    view.addSubview(chooseView)
    
    quizView.addSubviews([problemView])
    problemView.addSubviews([problemLabel])
    chooseView.addSubviews([firstButton, secondButton, thirdButton, fourthButton])
    
//    chooseView.addSubview(firstButton)
//    chooseView.addSubview(secondButton)
//    chooseView.addSubview(thirdButton)
//    chooseView.addSubview(fourthButton)
    
    problemView.layer.borderWidth = UI.viewBorderWith
    problemView.layer.borderColor = UI.viewBorderColor
    
    problemLabel.textAlignment = .center
    problemLabel.numberOfLines = 1
    problemLabel.adjustsFontSizeToFitWidth = true
    
    firstButton.layer.borderWidth = UI.viewBorderWith
    firstButton.layer.borderColor = UI.viewBorderColor
    secondButton.layer.borderWidth = UI.viewBorderWith
    secondButton.layer.borderColor = UI.viewBorderColor
    thirdButton.layer.borderWidth = UI.viewBorderWith
    thirdButton.layer.borderColor = UI.viewBorderColor
    fourthButton.layer.borderWidth = UI.viewBorderWith
    fourthButton.layer.borderColor = UI.viewBorderColor
  }
  
  func constraintUI() {
    quizView.snp.makeConstraints { make in
      make.left.right.equalToSuperview()
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      make.bottom.equalTo(chooseView.snp.top)
      make.height.equalTo(chooseView)
    }
    
    problemView.snp.makeConstraints { make in
      make.left.top.equalToSuperview().offset(20)
      make.right.bottom.equalToSuperview().offset(-20)
    }
    
    problemLabel.snp.makeConstraints { make in
      make.left.right.top.bottom.equalToSuperview()
    }
    
    chooseView.snp.makeConstraints { make in
      make.left.right.equalToSuperview()
      make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
    }
    
    firstButton.snp.makeConstraints { make in
      make.top.left.equalToSuperview().offset(20)
      make.right.equalTo(secondButton.snp.left).offset(-20)
      make.bottom.equalTo(thirdButton.snp.top).offset(-20)
      make.width.height.equalTo(secondButton)
      make.width.height.equalTo(thirdButton)
      make.width.height.equalTo(fourthButton)
    }
    
    secondButton.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(20)
      make.right.equalToSuperview().offset(-20)
      make.bottom.equalTo(fourthButton.snp.top).offset(-20)
    }
    
    thirdButton.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(20)
      make.bottom.equalToSuperview().offset(-20)
    }
    
    fourthButton.snp.makeConstraints { make in
      make.right.bottom.equalToSuperview().offset(-20)
    }
  }
  
  func setupEventBinding() {
    rx.viewWillAppear
      .bind(to: viewModel.viewWillAppear)
      .disposed(by: disposeBag)
    
    
  }
  
  func setupUIBinding() {
    
  }
}
