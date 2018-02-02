//
//  SettingViewModel.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 10..
//  Copyright © 2018년 kimin. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift

typealias SettingSection = SectionModel<String, String>

protocol SettingViewModelType: ViewModelType {
  // Event
  var willSelectTableViewRow: PublishSubject<(_: IndexPath, selectedIndexPaths: [IndexPath]?)> { get }
  var didSelectTableViewRow: PublishSubject<IndexPath> { get }
  var configureCell: PublishSubject<IndexPath> { get }
  
  // UI
  var rowSelection: Driver<(selected: Bool, indexPath: IndexPath, animated: Bool)> { get }
  var sectionedItems: Driver<[SettingSection]> { get }
  var willSelectTableViewRowIndexPath: BehaviorRelay<IndexPath?> { get }
}
  
struct SettingViewModel: SettingViewModelType {
  let disposeBag = DisposeBag()
  
  // MARK: -> Event
  
  let willSelectTableViewRow = PublishSubject<(_: IndexPath, selectedIndexPaths: [IndexPath]?)>()
  let didSelectTableViewRow = PublishSubject<IndexPath>()
  let configureCell = PublishSubject<IndexPath>()
  
  // MARK: <- UI
  
  let rowSelection: Driver<(selected: Bool, indexPath: IndexPath, animated: Bool)>
  let sectionedItems: Driver<[SettingSection]>
  let willSelectTableViewRowIndexPath: BehaviorRelay<IndexPath?>
  
  // MARK: - Initialize
  
  init() {
    
    let settingSections = [ SettingSection(model: "총 외울 기간 ", items: ["1달","2달", "3달"]),
                            SettingSection(model: "초기화", items: ["초기화"]),
                            SettingSection(model: "로그아웃 ", items: ["로그아웃"]) ]
      sectionedItems = Driver.just(settingSections)
    
    // TableView Selection
    
    let selectRowEvent = PublishSubject<(selected: Bool, indexPath: IndexPath, animated: Bool)>()
    rowSelection = selectRowEvent
      .asDriver(onErrorJustReturn: (selected: false, indexPath: IndexPath(), animated: false))
    
    let _willSelectTableViewRowIndexPath = BehaviorRelay<IndexPath?>(value: nil)
    willSelectTableViewRowIndexPath = _willSelectTableViewRowIndexPath
    
    willSelectTableViewRow
      .subscribe(onNext: { indexPath, selectedIndexPaths in
        guard let selectedIndexPaths = selectedIndexPaths else { return }
        selectedIndexPaths
          .filter { $0.section == indexPath.section }
          .forEach { selectRowEvent.onNext((selected: false, indexPath: $0, animated: false)) }
        _willSelectTableViewRowIndexPath.accept(indexPath)
      }).disposed(by: disposeBag)
    
    let settings = ["2달"]
    
    configureCell
      .subscribe(onNext: { indexPath in
        let item = settingSections[indexPath.section].items[indexPath.row]
        if settings.contains(item) {
          selectRowEvent.onNext((selected: true, indexPath: indexPath, animated: true))
        }
      }).disposed(by: disposeBag)
    
  }
  
}
