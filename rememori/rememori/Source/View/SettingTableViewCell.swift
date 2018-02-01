//
//  SettingTableViewCell.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 31..
//  Copyright © 2018년 kimin. All rights reserved.
//

import UIKit

final class SettingTableViewCell: UITableViewCell {
  
  // MARK: - Initialize
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemeted")
  }
  
  // MARK: - Configure Selection
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    if selected {
      accessoryType = .checkmark
      textLabel?.font = .boldSystemFont(ofSize: 14)
    } else {
      accessoryType = .none
      textLabel?.font = .systemFont(ofSize: 13)
      textLabel?.textColor = .darkGray
    }
  }
  
  // MARK: - Cell Contents
  
  func setTitleText(_ title: String) {
    textLabel?.text = title
  }
}
