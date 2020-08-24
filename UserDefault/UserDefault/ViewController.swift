//
//  SceneDelegate.swift
//  UserDefault
//
//  Created by 比留間龍三 on 2020/08/24.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet var textField:UITextField!
    @IBOutlet var label:UILabel!
    
    //ラベルの初期値
    var testText:String = "初期値"
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        userDefaults.register(defaults: ["DataStore": "初期値"])
        label.text = readData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        guard let text = textField.text else { return false }
        testText = text
        label.text = testText
    
        // キーボードを閉じる
        textField.resignFirstResponder()
        saveData(str: testText)
        
        return true
    }
    
    func saveData(str: String){
        // Keyを指定して保存
        userDefaults.set(str, forKey: "DataStore")
    }

    func readData() -> String {
        // Keyを指定して読み込み
        guard let str: String = userDefaults.object(forKey: "DataStore") as? String else { return "error" }
        
            return str
    }
    
    
    @IBAction func deleteButtonTapped(_ sender : AnyObject) {
        // Key の値を削除
        userDefaults.removeObject(forKey: "DataStore")
        
        // Keyを指定して読み込み
        guard let str: String = userDefaults.object(forKey: "DataStore") as? String else { return }
        label.text = str
    }
}

