//
//  SceneDelegate.swift
//  CarthageRealm
//
//  Created by 比留間龍三 on 2020/08/24.
//  Copyright © 2020 すいふと. All rights reserved.
//

import Foundation
import RealmSwift

class TrTodo: Object {

    @objc dynamic var todoId: String = NSUUID().uuidString    // タスクID
    @objc dynamic var todoTitle = ""                          // タイトル
    @objc dynamic var todoContents: String? = nil             // 内容
    @objc dynamic var created: String? = nil                    // 登録日
    @objc dynamic var modified: String? = nil                   // 変更日
    @objc dynamic var limitDate: String? = nil                  // 期限日
    @objc dynamic var deleteFlg = false                       // 削除フラグ
    
    override static func primaryKey() -> String? {
        return "todoId"
    }

}
