//
//  ViewController.swift
//  CarthageRealm
//
//  Created by 比留間龍三 on 2020/08/24.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    //Realmから受け取るデータ
    var todolists: [TrTodo]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let realm = try? Realm() else {return}
        // RealmFile表示
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        // Realmに登録されているデータを取得
        var todolistsResults:Results = realm.objects(TrTodo.self)
        todolistsResults = todolistsResults.filter("deleteFlg = false")
        todolists = Array(todolistsResults.sorted(byKeyPath: "limitDate", ascending: true))

    }

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let todolistCount = todolists?.count else { return 0 }
        return todolistCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as? TableViewCell else {fatalError("Wrong cell class dequeued")}

        guard let todoTitle = todolists?[indexPath.row]["todoTitle"] as? String,
              let limitDate = todolists?[indexPath.row]["limitDate"] as? String else {fatalError("Wrong cell class dequeued")}
        
        cell.todoTitleLabel.text = todoTitle
        cell.limitDateLabel.text = limitDate

        return cell
    }
    
    //セルの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    //スワイプしたセル削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {

            guard let realm = try? Realm() else {return}
            try? realm.write {
                let value = ["todoId": todolists?[indexPath.row]["todoId"], "deleteFlg": true]
                realm.create(TrTodo.self, value: value, update: .modified)
            }
            todolists?.remove(at: indexPath.row)
            table.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}
