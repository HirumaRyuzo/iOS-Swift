//
//  ViewController.swift
//  UITableView_NoSection
//
//  Created by 比留間龍三 on 2020/08/14.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
        @IBOutlet weak var commentTableView: UITableView!
    
// MARK: - pattern①Plistなし
//    //ディズニービッグ5のメンツを配列に設定
//    let DisneyBig5 = ["Mickey", "Minnie", "Donald", "Goofy", "Pluto"]
//
//    //セルの個数を指定するデリゲートメソッド
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return DisneyBig5.count
//    }
//
//    //セルの値を設定するデータソースメソッド
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // セルを取得する
//        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "DisneyCell", for: indexPath)
//        // セルに表示する値を設定する
//        cell.textLabel!.text = DisneyBig5[indexPath.row]
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("DisneyCell：\(indexPath.row) キャラクター：\(DisneyBig5[indexPath.row])")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    //高さを可変にする
//    commentTableView.estimatedRowHeight = 66
//    commentTableView.rowHeight = UITableView.automaticDimension
//    }
//    }
    
//// MARK: - pattern②Plistあり
     var _items:NSArray = []

        override func viewDidLoad() {
            super.viewDidLoad()

            // Plistファイルパス
            let path = Bundle.main.path(forResource: "DisneyCharacterList", ofType:"plist")
            _items = NSArray(contentsOfFile:path!)!

            //高さを可変にする
            commentTableView.estimatedRowHeight = 80
            commentTableView.rowHeight = UITableView.automaticDimension
    }

    // 設定
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    // 設定（行数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return _items.count
    }

    // 設定（セル）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "DisneyCell", for: indexPath as IndexPath)
        let dic = _items.object(at: indexPath.row) as! NSDictionary
        cell.textLabel!.text = dic.value(forKey: "Name") as? String
        cell.textLabel?.numberOfLines=0
        cell.textLabel?.sizeToFit()
        let imageName = dic.value(forKey: "Image") as! String
        cell.imageView?.image = UIImage(named: imageName)
        return cell
    }
    //セルタップ時にセルの内容を取得する
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DisneyCell", for: indexPath as IndexPath)
            let dic = _items.object(at: indexPath.row) as! NSDictionary
            cell.textLabel!.text = dic.value(forKey: "Name") as? String
            print(cell.textLabel!.text as Any)
        }
}
