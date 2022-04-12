//
//  Color.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import Foundation
import SwiftUI

extension Color {
    static let WHITEGRAY_8 = Color(hex: "#FBFBFB")
    static let LIGHTGRAY_8 = Color(hex: "#F5F5F5")
    static let ORANGE_8 = Color(hex: "#F4C7AB")
    static let GRAY_8 = Color(hex: "#D3D3D3")
    static let OLIVE_8 = Color(hex: "#B2B8A3")
}

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
