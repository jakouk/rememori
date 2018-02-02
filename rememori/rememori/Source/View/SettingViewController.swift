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

final class SettingViewController: UIViewController, ViewType {

  private struct UI {
    static let tableViewFrame = UIScreen.main.bounds
    static let tableViewSectionHeaderHeight = CGFloat(40)
    static let tableViewRowHeight = CGFloat(40)
    static let tableViewFooterHiehgt = CGFloat(40)
  }
  
  var disposeBag: DisposeBag!
  var viewModel: SettingViewModelType!
  var tableView = UITableView(frame: CGRect.zero, style: .grouped)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
  }
  
  func setupUI() {
    view.addSubview(tableView)
    
    view.backgroundColor = .green
    
    tableView.separatorColor = tableView.backgroundColor
    tableView.rowHeight = UI.tableViewRowHeight
    tableView.sectionHeaderHeight = UI.tableViewSectionHeaderHeight
    tableView.sectionFooterHeight = UI.tableViewFooterHiehgt
    tableView.allowsMultipleSelection = true
    tableView.register(cell: SettingTableViewCell.self)
  }
  
  func constraintUI() {
    tableView.snp.makeConstraints { make in
      make.left.right.equalToSuperview()
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
    }
  }
  
  func configureTableView() {
    //tableView.refreshControl = UIRefreshControl()
    tableView.estimatedRowHeight = 64
    tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  func setupEventBinding() {
    tableView.rx.itemSelected
      .bind(to: viewModel.didSelectTableViewRow)
      .disposed(by: disposeBag)
    
    tableView.rx.willDisplayHeaderViewForSection
      .subscribe(onNext: { view, _ in
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.textLabel?.textColor = .darkGray
      }).disposed(by: disposeBag)
    
    tableView.rx.setDelegate(self)
      .disposed(by: disposeBag)
  }
  
  func setupUIBinding() {
    let dataSource = RxTableViewSectionedReloadDataSource<SettingSection>(
      configureCell: { [weak self] (_, tableView, indexPath, item) in
        let cell = tableView.dequeue(SettingTableViewCell.self)!
        self?.viewModel.configureCell.onNext(indexPath)
        cell.setTitleText(item.capitalized)
        return cell
      }, titleForHeaderInSection: { (dataSource, index) ->  String? in
        dataSource.sectionModels[index].model
    })
    
    viewModel.sectionedItems.asDriver()
      .drive(tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
    
    viewModel.rowSelection
      .drive(onNext: { [weak self] (selected, indexPath, animated) in
        self?.tableViewRowSelection(willSelect: selected, indexPath: indexPath, animated: animated)
      }).disposed(by: disposeBag)
  }
  
  // MARK: Acion Handler
  
  private func tableViewRowSelection(willSelect: Bool, indexPath: IndexPath, animated: Bool) {
    if willSelect {
      tableView.selectRow(at: indexPath, animated: animated, scrollPosition: .none)
    } else {
      tableView.deselectRow(at: indexPath, animated: animated)
    }
  }
  
}

// MARK: - TableViewDelegate

extension SettingViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    viewModel.willSelectTableViewRow
      .onNext((indexPath, selectedIndexPaths: tableView.indexPathsForSelectedRows))
    return viewModel.willSelectTableViewRowIndexPath.value
  }
  
  func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
    return nil
  }
}
