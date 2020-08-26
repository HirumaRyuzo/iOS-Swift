//
//  File.swift
//  stv50_mrmt_32_36
//
//  Created by satoshi.marumoto on 2019/09/24.
//  Copyright © 2019 satoshi.marumoto. All rights reserved.
//

import Foundation
import RealmSwift

class WeatherModel: Object, Codable {
    // カラム定義
    @objc dynamic var date: String = ""
    @objc dynamic var telop: String = ""
    @objc dynamic var iconUrl: String = ""
    
}
