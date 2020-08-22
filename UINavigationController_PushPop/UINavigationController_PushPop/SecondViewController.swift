//
//  SceneDelegate.swift
//  UINavigationController_PushPop
//
//  Created by 比留間龍三 on 2020/08/23.
//  Copyright © 2020 すいふと. All rights reserved.
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
