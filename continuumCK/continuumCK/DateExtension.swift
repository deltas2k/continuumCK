//
//  DateExtension.swift
//  continuumCK
//
//  Created by Matthew O'Connor on 10/15/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import Foundation

extension Date {
  func stringWith(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = dateStyle
    formatter.timeStyle = timeStyle
    return formatter.string(from: self)
  }
}
