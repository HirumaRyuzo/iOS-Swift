//
//  ViewController.swift
//  UIDatePikerView
//
//  Created by 比留間龍三 on 2020/08/12.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateField: UITextField!
    
 var datePicker: UIDatePicker = UIDatePicker()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // ピッカー設定
            datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
            datePicker.timeZone = NSTimeZone.local
            datePicker.locale = Locale.current
            dateField.inputView = datePicker
            
            // 決定バーの生成
            let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
            let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
            toolbar.setItems([spacelItem, doneItem], animated: true)
            
            // インプットビュー設定
            dateField.inputView = datePicker
            dateField.inputAccessoryView = toolbar
            
            // デフォルト日付
                   let formatter = DateFormatter()
                   formatter.dateFormat = "yyyy-MM-dd"
                   datePicker.date = formatter.date(from: "2020-8-12")!
        }
        
        // 決定ボタン押下
        @objc func done() {
            dateField.endEditing(true)
            
            // 日付のフォーマット
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            dateField.text = "\(formatter.string(from: Date()))"
        }
    }
