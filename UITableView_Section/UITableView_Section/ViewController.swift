//
//  ViewController.swift
//  UITableView_Section
//
//  Created by 比留間龍三 on 2020/08/16.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

struct HogeItem: Decodable {
    let Name: String
    let Image: String
}

struct HogeSection: Decodable {
    let SectionName: String
    let Items: [HogeItem]
}

var _items: [HogeSection] = []

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
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
//    }

    // MARK: - pattern②Plistあり
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "DisneyCharacterList", ofType:"plist" ) {
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            _items = try! PropertyListDecoder().decode([HogeSection].self, from: data)
        }
        
        //高さを可変にする
        commentTableView.estimatedRowHeight = 66
        commentTableView.rowHeight = UITableView.automaticDimension
    }
    
    // 設定
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return _items.count
    }
    
    // 設定（行数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _items[section].Items.count
    }
    
    //セクション数の設定
    func numberOfSections(in tableView: UITableView) -> Int {
        return _items.count
    }
    
    // 設定（セクションタイトル）
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return _items[section].SectionName
    }
    
    // 設定（セル）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = _items[indexPath.section].Items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DisneyCell", for: indexPath as IndexPath)
        cell.textLabel?.numberOfLines=0
        cell.textLabel?.text = item.Name
        cell.imageView?.image = UIImage(named: item.Image)
        
        //セルのサイズを指定
//        image.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return cell
    }
    
    //セルタップ時にセルの内容を取得する
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = _items[indexPath.section].Items[indexPath.row]
        
        print(item.Name)
    }
}

