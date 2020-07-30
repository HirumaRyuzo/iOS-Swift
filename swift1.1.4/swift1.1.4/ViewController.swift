//
//  ViewController.swift
//  swift1.1.4
//
//  Created by 比留間龍三 on 2020/07/29.
//  Copyright © 2020 すいふと. All rights reserved.
//

/*Account（名簿）クラスを作成し、
社員一覧をコンソールにログを出力する。(Print)

Accountクラスには、下記のプロパティとメソッドを定義する。

【プロパティ】
氏名：文字列型
年齢：整数型
性別：文字列型
得意な言語：文字列型

【メソッド】
男性の場合、「○○君は、○○が得意な○○歳です。」と表示する
女性の場合、「○○さんは、○○が得意な○○歳です。」と表示する。*/

import UIKit


class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tarou = Account(name: "太郎", age: 30, gender: "男性", language: "swift")
        let hanako = Account(name: "華子", age: 20, gender: "女性", language: "objective-c")

        let lists :Array<Any> = [tarou,hanako]
        
        for list in lists {
            
        }
    }
        
}
