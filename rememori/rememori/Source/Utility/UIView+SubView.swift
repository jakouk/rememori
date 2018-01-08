//
//  UIView+SubView.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 8..
//  Copyright © 2018년 kimin. All rights reserved.
//

import UIKit

extension UIView {
  func addSubviews(_ views: [UIView]) {
    for view in views {
      addSubview(view)
    }
  }
}
