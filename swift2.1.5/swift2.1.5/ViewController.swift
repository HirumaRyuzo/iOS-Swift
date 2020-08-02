//
//  ViewController.swift
//  swift2.1.5
//
//  Created by 比留間龍三 on 2020/08/02.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func alert(_ sender: UIButton) {
        // ① UIAlertControllerクラスのインスタンスを生成
           // タイトル, メッセージ, Alertのスタイルを指定する
           // 第3引数のpreferredStyleでアラートの表示スタイルを指定する
        let alert: UIAlertController = UIAlertController(title: "アラート表示", message: "保存してもいいですか？", preferredStyle:  UIAlertController.Style.actionSheet)

           // ② Actionの設定
           // Action初期化時にタイトル, スタイル, 押された時に実行されるハンドラを指定する
           // 第3引数のUIAlertActionStyleでボタンのスタイルを指定する
           // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(title: "Facebook", style: UIAlertAction.Style.default, handler:{
               // ボタンが押された時の処理を書く（クロージャ実装）
               (action: UIAlertAction!) -> Void in
               print("Facebook")
           })
        let defaultAction_1: UIAlertAction = UIAlertAction(title: "Twiter", style: UIAlertAction.Style.default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                print("Twiter")
            })
        let defaultAction_2: UIAlertAction = UIAlertAction(title: "LINE", style: UIAlertAction.Style.default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                print("LINE")
            })
           // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
               // ボタンが押された時の処理を書く（クロージャ実装）
               (action: UIAlertAction!) -> Void in
               print("Cancel")
           })

        // ③ UIAlertControllerにActionを追加
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        alert.addAction(defaultAction_1)
        alert.addAction(defaultAction_2)

        // ④ Alertを表示
        present(alert, animated: true, completion: nil)
    }
}

