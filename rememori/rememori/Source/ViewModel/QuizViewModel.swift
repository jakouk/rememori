//
//  QuizViewModel.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 9..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

import CSV

protocol QuizViewModelType: ViewModelType {
  // Event
  var viewWillAppear: PublishSubject<Void> { get }
  var resultTapButton: PublishSubject<Void> { get }
  
  // UI
  var quizProblem: Driver<[[String]]> { get }
  
}

// MARK: - Struct Implementation
struct QuizViewModel: QuizViewModelType {
  
  // MARK: Input
  // MARK: -> Event
  let viewWillAppear = PublishSubject<Void>()
  let resultTapButton = PublishSubject<Void>()
  
  // MARK: Output
  // MARK: <- UI
  let quizProblem: Driver<[[String]]>
  
  
  // MARK: Output
  // MARK: - Initialize
  init() {
    
    var firstArray = [String]()
    var secondAfterArray = [String]()
    
    let stream = InputStream(fileAtPath: "/Users/unbTech/desktop/demo.csv")!
    let csv = try! CSVReader(stream: stream)
    
    var problemArray = [[String]]()
    var array = [[String]]()
    
    while let row = csv.next() {
      print("\(row)")
      
      problemArray.append(row)
      firstArray.append(row[0])
      secondAfterArray.append(row[1])
    }
    
    array.append(firstArray)
    array.append(secondAfterArray)
    
    
    quizProblem = Observable<Void>
      .merge([viewWillAppear])
      .map({ Void -> [[String]]  in
        return array
      })
      .asDriver(onErrorJustReturn: [[String]]())
    
  }
}
