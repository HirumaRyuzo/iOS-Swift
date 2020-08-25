//
//  SceneDelegate.swift
//  CarthageRealm
//
//  Created by 比留間龍三 on 2020/08/24.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class GetDay {
    class func getToday(format:String) -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = format
        return formatter.string(from: now as Date)
    }

    class func getTomorrow(format:String) -> String {
        let now = Date()
        let calendar = Calendar.current
        guard let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: now)) else {return "error"}
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = format
        return formatter.string(from: tomorrow)
    }
}
