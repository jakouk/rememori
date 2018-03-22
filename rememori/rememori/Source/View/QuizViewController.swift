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
    static let buttonTitleColor = UIColor.black
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
      make.leading.trailing.equalToSuperview()
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      make.bottom.equalTo(chooseView.snp.top)
      make.height.equalTo(chooseView)
    }
    
    problemView.snp.makeConstraints { make in
      make.leading.top.equalToSuperview().offset(20)
      make.trailing.bottom.equalToSuperview().offset(-20)
    }
    
    problemLabel.snp.makeConstraints { make in
      make.leading.trailing.top.bottom.equalToSuperview()
    }
    
    chooseView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
    }
    
    firstButton.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().offset(20)
      make.trailing.equalTo(secondButton.snp.leading).offset(-20)
      make.bottom.equalTo(thirdButton.snp.top).offset(-20)
      make.width.height.equalTo(secondButton)
      make.width.height.equalTo(thirdButton)
      make.width.height.equalTo(fourthButton)
    }
    
    secondButton.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(20)
      make.trailing.equalToSuperview().offset(-20)
      make.bottom.equalTo(fourthButton.snp.top).offset(-20)
    }
    
    thirdButton.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.bottom.equalToSuperview().offset(-20)
    }
    
    fourthButton.snp.makeConstraints { make in
      make.trailing.bottom.equalToSuperview().offset(-20)
    }
  }
  
  // MARK: - -> Rx Event Binding
  
  func setupEventBinding() {
    rx.viewWillAppear
      .bind(to: viewModel.viewWillAppear)
      .disposed(by: disposeBag)
    
    Observable.merge(firstButton.rx.tap.asObservable(), secondButton.rx.tap.asObservable(),
                     thirdButton.rx.tap.asObservable(), fourthButton.rx.tap.asObservable())
      .bind(to: viewModel.resultTapButton)
      .disposed(by: disposeBag)
    
    // 위의 코드로 하나로 합침.
    
//    firstButton.rx.tap
//      .bind(to: viewModel.resultTapButton)
//      .disposed(by: disposeBag)
//
//    secondButton.rx.tap
//      .bind(to: viewModel.resultTapButton)
//      .disposed(by: disposeBag)
//
//    thirdButton.rx.tap
//      .bind(to: viewModel.resultTapButton)
//      .disposed(by: disposeBag)
//
//    fourthButton.rx.tap
//      .bind(to: viewModel.resultTapButton)
//      .disposed(by: disposeBag)
    
  }
  
  // MARK: - <- Rx UI Binding
  
  func setupUIBinding() {
    
    viewModel.quizProblem
      .drive(onNext: { [weak self] (array) in
        
        let firstArray = array.first
        let secondAfterArray = array.last
        
        self?.problemLabel.text = firstArray?.first
        
        self?.firstButton.setTitle(secondAfterArray?[0], for: .normal)
        self?.firstButton.setTitleColor(UI.buttonTitleColor, for: .normal)
        
        self?.secondButton.setTitle(secondAfterArray?[1], for: .normal)
        self?.secondButton.setTitleColor(UI.buttonTitleColor, for: .normal)
        
        self?.thirdButton.setTitle(secondAfterArray?[2], for: .normal)
        self?.thirdButton.setTitleColor(UI.buttonTitleColor, for: .normal)
        
        self?.fourthButton.setTitle(secondAfterArray?[3], for: .normal)
        self?.fourthButton.setTitleColor(UI.buttonTitleColor, for: .normal)
        
      }).disposed(by: disposeBag)
    
  }
}
