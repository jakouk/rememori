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
  
  
}
