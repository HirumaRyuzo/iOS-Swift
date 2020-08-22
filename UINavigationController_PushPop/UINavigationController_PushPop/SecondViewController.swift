//
//  NextViewController.swift
//  stv50_mrmt_23
//
//  Created by 丸本聡 on 2019/08/19.
//  Copyright © 2019 丸本聡. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func popButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
