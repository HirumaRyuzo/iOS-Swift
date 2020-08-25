//
//  SceneDelegate.swift
//  CarthageRealm
//
//  Created by 比留間龍三 on 2020/08/24.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit
import RealmSwift

class CreateViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var todoTitleTextField: UITextField!
    @IBOutlet weak var todoContentsTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        button.isEnabled = false
    }
    
    @IBAction func returnKeyClose(_ sender: Any) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if todoTitleTextField.text == "" {
            button.isEnabled = false
        } else {
            button.isEnabled = true
        }
    }
    
    @IBAction func createButton(sender: Any){

        let trTodo: TrTodo = TrTodo()
        guard let titleText = todoTitleTextField.text else {return}
        guard let contentsText = todoContentsTextField.text else {return}

        trTodo.todoTitle = titleText
        trTodo.todoContents = contentsText

        trTodo.created = GetDay.getToday(format:"yyyy-MM-dd")
        trTodo.modified =  GetDay.getToday(format:"yyyy-MM-dd")
        trTodo.limitDate = GetDay.getTomorrow(format:"yyyy-MM-dd")

        guard let realm = try? Realm() else { return }
        try? realm.write {
            realm.add(trTodo, update: .modified)
        }
        
    }

}
