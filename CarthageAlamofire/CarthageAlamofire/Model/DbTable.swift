//
//  DbTable.swift
//  CarthageAlamofire
//
//  Created by 比留間龍三 on 2020/08/26.
//  Copyright © 2020 すいふと. All rights reserved.
//

import Foundation
import RealmSwift

class DbTable: Object, Codable {
    // カラム定義
    @objc dynamic var id: String = NSUUID().uuidString
    @objc dynamic var date: String = ""
    @objc dynamic var telop: String = ""
    @objc dynamic var iconUrl: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
