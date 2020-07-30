//
//  Account.swift
//  swift1.1.4
//
//  Created by 比留間龍三 on 2020/07/29.
//  Copyright © 2020 すいふと. All rights reserved.
//

import Foundation

class Account {
    var name:String!
    var age:Int!
    var gender:String!
    var language:String!

    init(name:String,age:Int,gender:String,language:String) {
        self.name = name
        self.age = age
        self.gender = gender
        self.language = language
    }

    func SelfIntroduction() {
        if self.gender == "男性"{
            print("\(self.name!)君は、\(self.language!)が得意な\(self.age!)歳です。")
        } else{
            print("\(self.name!)さんは、\(self.language!)が得意な\(self.age!)歳です。")
        }
    }
}
