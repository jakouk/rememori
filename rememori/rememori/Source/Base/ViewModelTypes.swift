//
//  ViewModelTypes.swift
//  rememori
//
//  Created by unbTech on 2018. 1. 29..
//  Copyright © 2018년 kimin. All rights reserved.
//

import Foundation

protocol ViewModelTypes {
  associatedtype Input
  associatedtype Output
  
  func transform(input: Input) -> Output
}
