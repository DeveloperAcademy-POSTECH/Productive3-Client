//
//  DateToString.swift
//  ProductiveThree
//
//  Created by Leo Bang on 2022/04/12.
//

import Foundation

class DateToString {
    static func resolve(date: Date) -> String {
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy-MM-dd";
        formatter.timeZone = TimeZone.autoupdatingCurrent
        return formatter.string(from: date)
    }
}
