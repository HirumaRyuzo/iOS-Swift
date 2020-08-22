//
//  ViewController.swift
//  ParameterPassing
//
//  Created by 比留間龍三 on 2020/08/23.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // 引数（文字列）
    var argString = ""
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 引数をラベルにセット
        label.text = argString
    }
    
    @IBAction func backView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

