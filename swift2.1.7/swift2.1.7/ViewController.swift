//
//  ViewController.swift
//  swift2.1.7
//
//  Created by 比留間龍三 on 2020/08/06.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // キーボードを閉じる
        view.endEditing(true)
    }
}
