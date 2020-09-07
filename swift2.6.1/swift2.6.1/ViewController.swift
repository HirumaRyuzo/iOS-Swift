//
//  ViewController.swift
//  swift2.6.1
//
//  Created by 比留間龍三 on 2020/09/04.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func safariJump(_ sender: Any) {
        UIApplication.shared.open(URL(string:"https://www.google.co.jp/search?q=stv://")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

