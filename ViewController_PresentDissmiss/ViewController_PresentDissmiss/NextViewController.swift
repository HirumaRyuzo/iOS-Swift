//
//  SceneDelegate.swift
//  ViewController_PresentDissmiss
//
//  Created by 比留間龍三 on 2020/08/23.
//  Copyright © 2020 すいふと. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func goBack(_ sender:UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
