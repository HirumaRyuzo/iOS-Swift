//
//  ViewController.swift
//  ParameterPassing
//
//  Created by 比留間龍三 on 2020/08/23.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
        
    @IBOutlet weak var textField: UITextField?
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    // セグエ実行前処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Segueの識別子確認
        if segue.identifier == "toSecondView" {
            
            // 遷移先ViewCntrollerの取得
            guard let nextView = segue.destination as? SecondViewController else { return }
            
            guard let text = textField?.text else { return }
            // 値の設定
            nextView.argString = text
        }
    }
}

